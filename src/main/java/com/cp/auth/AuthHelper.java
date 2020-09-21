package com.cp.auth;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.security.PrivateKey;
import java.security.Security;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.bouncycastle.asn1.pkcs.PrivateKeyInfo;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.bouncycastle.openssl.jcajce.JceOpenSSLPKCS8DecryptorProviderBuilder;
import org.bouncycastle.operator.InputDecryptorProvider;
import org.bouncycastle.pkcs.PKCS8EncryptedPrivateKeyInfo;
import org.jose4j.jws.AlgorithmIdentifiers;
import org.jose4j.jws.JsonWebSignature;
import org.jose4j.jwt.JwtClaims;

public class AuthHelper {
	
	public static String getBoxAccessToken(String configName) {
		String accessToken = "";
		try {
			File file = new File(AuthHelper.class.getClassLoader().getResource(configName).getFile());          
			FileReader reader = new FileReader(file);
			System.out.println("after FileReader reader::: "+reader);
			
			Gson gson = new GsonBuilder().create();
			Config config = (Config) gson.fromJson(reader, Config.class);
			System.out.println("after Gson config::: "+config);
			
			// We use BouncyCastle to handle the decryption
            // (https://www.bouncycastle.org/java.html)
            Security.addProvider(new BouncyCastleProvider());
            System.out.println("after Security ::: ");
            
            
            // Using BouncyCastle's PEMParser we convert the
            // encrypted private key into a keypair object
            PEMParser pemParser = new PEMParser(new StringReader(config.boxAppSettings.appAuth.privateKey));
            Object keyPair = pemParser.readObject();
            pemParser.close();
            System.out.println("after PEMParser keyPair::: "+keyPair);
            
            
            //Need below to avoid installing JCE extensions manually, That certainly means the JCE files are not installed properly. Please try steps listed below
            //Field field = Class.forName("javax.crypto.JceSecurity").getDeclaredField("isRestricted");
			//field.setAccessible(true);
			//field.set(null, java.lang.Boolean.FALSE);
			//System.out.println("after javax.crypto.JceSecurity Field::: ");
			
           //Need below to avoid installing JCE extensions manually, That certainly means the JCE files are not installed properly. hack for JCE Unlimited Strength
            Field field = Class.forName("javax.crypto.JceSecurity").getDeclaredField("isRestricted");
            field.setAccessible(true);

            Field modifiersField = Field.class.getDeclaredField("modifiers");
            modifiersField.setAccessible(true);
            modifiersField.setInt(field, field.getModifiers() & ~Modifier.FINAL);

            field.set(null, false);
          
            
            System.out.println("after javax.crypto.JceSecurity Field::: ");
			
            // Finally, we decrypt the key using the passphrase
            char[] passphrase = config.boxAppSettings.appAuth.passphrase.toCharArray();
            JceOpenSSLPKCS8DecryptorProviderBuilder decryptBuilder = new JceOpenSSLPKCS8DecryptorProviderBuilder()
                    .setProvider("BC");
            
            InputDecryptorProvider decryptProvider = decryptBuilder.build(passphrase);
            PrivateKeyInfo keyInfo = ((PKCS8EncryptedPrivateKeyInfo) keyPair).decryptPrivateKeyInfo(decryptProvider);
            System.out.println("after passphrase PrivateKeyInfo keyInfo::: "+keyInfo);
            
            
            // In the end, we will use this key in the next steps
            PrivateKey key = (new JcaPEMKeyConverter()).getPrivateKey(keyInfo);
            System.out.println("after PrivateKey key::: "+key);
            
            
            // We will need the authenticationUrl again later,
            // so it is handy to define here
            String authenticationUrl = "https://api.box.com/oauth2/token";

            // Rather than constructing the JWT assertion manually, we are
            // using the org.jose4j.jwt library.
            JwtClaims claims = new JwtClaims();
            claims.setIssuer(config.boxAppSettings.clientID);
            claims.setAudience(authenticationUrl);
            claims.setSubject(config.enterpriseID);
            claims.setClaim("box_sub_type", "enterprise");
            
            System.out.println("after JwtClaims ::: ");
            // This is an identifier that helps protect against
            // replay attacks
            claims.setGeneratedJwtId(64);
            // We give the assertion a lifetime of 45 seconds
            // before it expires
            claims.setExpirationTimeMinutesInTheFuture(0.75f);
            System.out.println("after claims ::: ");
            // With the claims in place, it's time to sign the assertion
            JsonWebSignature jws = new JsonWebSignature();
            jws.setPayload(claims.toJson());
            jws.setKey(key);
            // The API support "RS256", "RS384", and "RS512" encryption
            jws.setAlgorithmHeaderValue(AlgorithmIdentifiers.RSA_USING_SHA512);
            jws.setHeader("typ", "JWT");
            jws.setHeader("kid", config.boxAppSettings.appAuth.publicKeyID);
            String assertion = jws.getCompactSerialization();
            
            System.out.println("after JsonWebSignature ::: ");
            // We are using the excellent org.apache.http package
            // to simplify the API call

            // Create the params for the request
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            // This specifies that we are using a JWT assertion
            // to authenticate
            params.add(new BasicNameValuePair("grant_type", "urn:ietf:params:oauth:grant-type:jwt-bearer"));
            // Our JWT assertion
            params.add(new BasicNameValuePair("assertion", assertion));
            // The OAuth 2 client ID and secret
            params.add(new BasicNameValuePair("client_id", config.boxAppSettings.clientID));
            params.add(new BasicNameValuePair("client_secret", config.boxAppSettings.clientSecret));
            
            System.out.println("after params ::: ");
            // Make the POST call to the authentication endpoint
            CloseableHttpClient httpClient = HttpClientBuilder.create().disableCookieManagement().build();
            HttpPost request = new HttpPost(authenticationUrl);
            request.setEntity(new UrlEncodedFormEntity(params));
            CloseableHttpResponse httpResponse = httpClient.execute(request);
            HttpEntity entity = httpResponse.getEntity();
            String response = EntityUtils.toString(entity);
            httpClient.close();
            
            System.out.println("after httpClient ::: ");
            Token token = (Token) gson.fromJson(response, Token.class);
            accessToken = token.access_token;
           
           /* String url = "https://api.box.com/2.0/folders/77882222167";

            CloseableHttpClient httpClient2 = HttpClientBuilder.create().disableCookieManagement().build();
            HttpGet getRequest = new HttpGet(url);
            getRequest.setHeader(HttpHeaders.AUTHORIZATION, String.format("Bearer %s", accessToken));
            
            System.out.println("after httpClient2 ::: ");
            httpResponse = httpClient2.execute(getRequest);
            entity = httpResponse.getEntity();
            String data = EntityUtils.toString(entity);

            System.out.println("JWT TOKEN :::: "+data); */

            System.out.println("JWT TOKEN :::: "+accessToken);
	            
		}catch (Exception e) {
	        System.err.println("Catch Exception "+e.getMessage());
	    }
	    return accessToken;
	}
	
	// Define a class that we can parse the json into
	class Config {
	    class BoxAppSettings {
	        class AppAuth {
	            String privateKey;
	            String passphrase;
	            String publicKeyID;
	        }

	        String clientID;
	        String clientSecret;
	        AppAuth appAuth;
	    }

	    BoxAppSettings boxAppSettings;
	    String enterpriseID;
	}

	// Parse the JSON using Gson to a Token object
	class Token {
	    String access_token;
	}
}
