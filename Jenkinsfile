pipeline
{
	agent any
	stages
	{
		stage('Build Application'){
			steps{
				bat 'mvn clean install -DskepTests'
			}
		}
			
		stage('Deploy Application To Cloudhub Environment'){
		environment {
        ANYPOINT_CREDENTIALS = credentials('cp-anypoint-creds')
      	}
			
			steps{
				bat 'mvn package deploy -DmuleDeploy -Dusername=${ANYPOINT_CREDENTIALS_USR} -Dpassword=${ANYPOINT_CREDENTIALS_PSW} -Denvironment=US-QA  -DworkerType=Micro -Dworkers=1 -DapplicationName=common-sys-ci-cd-test'
			}
			steps{
				bat 'mvn package deploy -DmuleDeploy -Dusername=${ANYPOINT_CREDENTIALS_USR} -Dpassword=${ANYPOINT_CREDENTIALS_PSW} -Denvironment=UAT-US  -DworkerType=Micro -Dworkers=1 -DapplicationName=common-sys-ci-cd-test-uat'
			}
		}
		
	}
}