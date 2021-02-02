pipeline {
    agent any
    
    environment {
        verCode = UUID.randomUUID().toString()
    }

    tools {
        // Install the Maven version configured as "Maven3.6.3" and add it to the path.
        maven "Maven"
    }

    stages {
        stage('SCM') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'master', url: 'https://github.com/ShivaniJ-hub/JenkinsPipeline.git' 

                //Creating version.html and writing string to it
                sh script:'''
                      touch musicstore/src/main/webapp/version.html
                '''
                println verCode
                writeFile file: "musicstore/src/main/webapp/version.html", text: verCode
	          }
	      }
	    
	      stage('Build'){
	            steps{
			   
                  // To run Maven on agent, use
                  sh script:'''
                      cd musicstore
                      mvn clean package
                  '''
              }
        }
        stage('Deploy to container ') {
              steps {
              }
        }
    }
}
