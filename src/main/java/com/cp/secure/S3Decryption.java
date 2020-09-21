package com.cp.secure;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.security.Key;
import java.security.KeyPair;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.BasicSessionCredentials;
import com.amazonaws.services.s3.AmazonS3EncryptionClientV2Builder;
import com.amazonaws.services.s3.AmazonS3EncryptionV2;
import com.amazonaws.services.s3.model.CryptoConfigurationV2;
import com.amazonaws.services.s3.model.CryptoMode;
import com.amazonaws.services.s3.model.EncryptionMaterials;
import com.amazonaws.services.s3.model.StaticEncryptionMaterialsProvider;
import com.amazonaws.services.securitytoken.AWSSecurityTokenService;
import com.amazonaws.services.securitytoken.AWSSecurityTokenServiceClientBuilder;
import com.amazonaws.services.securitytoken.model.AssumeRoleRequest;
import com.amazonaws.services.securitytoken.model.AssumeRoleResult;
import com.amazonaws.util.IOUtils;

public class S3Decryption {

	public static Logger logger = Logger.getLogger("com.cp.secure");

	public static byte[] fileDecryption(String bucketName, String keyName, String accessKeyId, String sceretKey,
			String region, String role, Map<String, String> encrypt) throws Exception {
		logger.setLevel(Level.INFO);
		AmazonS3EncryptionV2 s3Encryption = null;
		S3Decryption decryption = new S3Decryption();
		try {
			KeyPair keypair = decryption.loadJksPrivateKey(encrypt);
			BasicAWSCredentials awsCreds = new BasicAWSCredentials(accessKeyId, sceretKey);
			AWSSecurityTokenService stsClient = AWSSecurityTokenServiceClientBuilder.standard().withRegion(region)
					.withCredentials(new AWSStaticCredentialsProvider(awsCreds)).build();
			AssumeRoleRequest roleRequest = new AssumeRoleRequest().withRoleArn(role).withRoleSessionName("read")
					.withDurationSeconds(3600);
			AssumeRoleResult roleResponse = stsClient.assumeRole(roleRequest);
			BasicSessionCredentials basicSessionCredentials = new BasicSessionCredentials(
					roleResponse.getCredentials().getAccessKeyId(), roleResponse.getCredentials().getSecretAccessKey(),
					roleResponse.getCredentials().getSessionToken());
			s3Encryption = AmazonS3EncryptionClientV2Builder.standard().withRegion(region)
					.withCryptoConfiguration(
							new CryptoConfigurationV2().withCryptoMode(CryptoMode.AuthenticatedEncryption))
					.withEncryptionMaterialsProvider(
							new StaticEncryptionMaterialsProvider(new EncryptionMaterials(keypair)))
					.withCredentials(new AWSStaticCredentialsProvider(basicSessionCredentials)).build();

			return (IOUtils.toByteArray(s3Encryption.getObject(bucketName, keyName).getObjectContent()));

		} catch (Exception e) {
			logger.info("Decryption error is::" + e.getMessage());
			throw new Exception(e.getMessage());

		} finally {
			if (s3Encryption != null) {
				s3Encryption.shutdown();
			}

		}

	}

	public KeyPair loadJksPrivateKey(Map<String, String> encrypt) throws Exception {
		logger.info("Value is::" + encrypt.get("key_path").toString());
		FileInputStream keyInputStream = new FileInputStream(encrypt.get("key_path").toString());
		KeyStore keystore = KeyStore.getInstance(KeyStore.getDefaultType());
		keystore.load(keyInputStream, encrypt.get("key_password").toString().toCharArray());
		String alias = encrypt.get("key_alias").toString();
		Key key = keystore.getKey(alias, encrypt.get("key_password").toString().toCharArray());
		return new KeyPair(null, (PrivateKey) key);
	}

	/*
	 * public static void main(String str[]) { OutputStream outStream = null;
	 * Map<String, String> map = new HashMap<String, String>(); map.put("key_path",
	 * "C:/Avadesh/Keys/marketokeystore-qa.jks"); map.put("key_alias",
	 * "marketo-qa"); map.put("key_password", "changeit"); try {
	 * 
	 * byte[] data = fileDecryption("cp-qa-ore-marketo-driver-sync",
	 * "NOSData/2020-09-02/marketo_export_chunks_01.gzip", "AKIA6OBDM36ELEEHKBPM",
	 * "T46MZ9TxiV/R4So7OfO6ULqDFEAETdO6rlBaLuAo", "us-west-2",
	 * "arn:aws:iam::992211689352:role/cp-qa-marketo-driver-sync-mulesoft-operator",
	 * map); File targetFile = new
	 * File("C:\\Avadesh\\Marketo\\exported\\marketo_export_chunks_01.gzip");
	 * outStream = new FileOutputStream(targetFile); outStream.write(data);
	 * 
	 * } catch (Exception e) { e.printStackTrace();
	 * 
	 * } finally { try { outStream.close(); } catch (Exception e) {
	 * e.getStackTrace(); } }
	 * 
	 * }
	 */

}
