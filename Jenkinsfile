pipeline {
   agent any
   stages {
      stage('Build') {
        /*steps {
          echo 'Building...'
          sh ''' 
          tag=$(git describe --tags) 
          echo $tag
          release=$(curl -XPOST --data "{\"tag_name\": \"$tag\", \"target_commitish\": \"master\", \"name\": \"test_release\", \"body\": \"description\", \"draft\": false, \"prerelease\": true}" https://api.github.com/icky-baker/condor/releases)
          echo Release $release is successfully released
          '''
        }*/
         steps {
            withEnv(["HOME=${env.WORKSPACE}"]){
         sh 'PATH=${PATH}:/usr/local/bin'
         sh 'git branch'
         sh 'git pull origin master'
         sh 'pip install -r requirements.txt' 
            }
         }
      }
      
   stage('Test') {
     steps {
        echo 'Testing...'
        sh 'make lint'
        
     }
   }
   stage('Deploy') {
     steps {
       echo 'Deploying...'
       sh 'make deploy'
   }
  }
}
}

