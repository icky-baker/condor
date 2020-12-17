pipeline {
   agent any
   stages {
      stage('Build') {
        steps {
          echo 'Building...'
          sh ''' 
          tag=$(git describe --tags)
          if [ expr match "$tag" 'v[0-9][.][0-9]' ] 
          then 
            echo $tag
          else
            tag="v0.1"
          fi
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
