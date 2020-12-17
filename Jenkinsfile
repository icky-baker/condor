pipeline {
   agent any
   stages {
      stage('Build') {
        steps {
          echo 'Building...'
          script {
            createRelease(
            user: "trnsprntt",
            repository: "icky-baker/condor",
#           tag: "${GIT_TAG_TO_USE}",
            name: "release lalala",
            description: "hop hey"
            )
          }
        }
      }
      
   stage('Test') {
     steps {
        echo 'Testing...'
     }
   }
   stage('Deploy') {
     steps {
       echo 'Deploying...'
     }
   }
  }
}
