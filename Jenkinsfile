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
		stage('Deploy Application To Cloudhub'){
		environment {
        ANYPOINT_CREDENTIALS = credentials('anypoint.platform')
      }
		
			steps{
				bat 'mvn package deploy -DmuleDeploy -Dusername=${ANYPOINT_CREDENTIALS_USR} -Dpassword=${ANYPOINT_CREDENTIALS_PSW} -Denvironment=Sandbox  -DworkerType=Micro -Dworkers=1'
			}
		}
	}
}