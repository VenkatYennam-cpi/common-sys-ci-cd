package com.cp.secure;

import java.util.logging.Level;
import java.util.logging.Logger;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.BasicSessionCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectResult;
import com.amazonaws.services.securitytoken.AWSSecurityTokenService;
import com.amazonaws.services.securitytoken.AWSSecurityTokenServiceClientBuilder;
import com.amazonaws.services.securitytoken.model.AssumeRoleRequest;
import com.amazonaws.services.securitytoken.model.AssumeRoleResult;

public class copyObject {
	public static Logger logger = Logger.getLogger("com.cp.secure");
	public static CopyObjectResult copySecure(String from_bucket, String from_object, String to_bucket,
			String to_object, String accessKeyId, String secretKey, String region,String roleArn) throws Exception {
		logger.setLevel(Level.INFO);
		try {
			BasicAWSCredentials awsCreds = new BasicAWSCredentials(accessKeyId, secretKey);
			AWSSecurityTokenService stsClient = AWSSecurityTokenServiceClientBuilder.standard().withRegion(region)
					.withCredentials(new AWSStaticCredentialsProvider(awsCreds)).build();
			AssumeRoleRequest roleRequest = new AssumeRoleRequest()
					.withRoleArn(roleArn)
					.withRoleSessionName("copy")
                    .withDurationSeconds(3600);
			AssumeRoleResult roleResponse = stsClient.assumeRole(roleRequest);
			BasicSessionCredentials basicSessionCredentials = new BasicSessionCredentials(
					roleResponse.getCredentials().getAccessKeyId(), roleResponse.getCredentials().getSecretAccessKey(),
					roleResponse.getCredentials().getSessionToken());
			AmazonS3 s3 = AmazonS3ClientBuilder.standard().withRegion(region)
					.withCredentials(new AWSStaticCredentialsProvider(basicSessionCredentials)).build();
			CopyObjectResult cor = s3.copyObject(from_bucket, from_object, to_bucket, to_object);
			return cor;
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}

	}

}
