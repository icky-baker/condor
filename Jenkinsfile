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
          id=$(echo "$release" | sed -n -e 's/"id":\([0-9]\+\),/\1/p' | head -n 1 | sed 's/[[:blank:]]//g')
          echo Release $id is successfully released
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
