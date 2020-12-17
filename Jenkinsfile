pipeline {
   agent any
   stages {
      stage('Build') {
        steps {
          echo 'Building...'
          def tag = "v0.1"
          sh ''' 
          tag=$(git describe --tags)
          echo $tag
          release=$(curl -XPOST --data "{\"tag_name\": \"$tag\", \"target_commitish\": \"master\", \"name\": \"test_release\", \"body\": \"description\", \"draft\": false, \"prerelease\": true}" https://api.github.com/icky-baker/condor/releases)
          echo Release $release is successfully released
          '''
        }
      }
      
   stage('Test') {
     steps {
        echo 'Testing...'
        sh 'make check'
        
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
