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
            sh 'git branch'
            sh 'git pull origin master'
            sh 'pip3 install -r requirements.txt'
            sh './condor/manage.py check'
         }
      }
      
   stage('Test') {
     steps {
        echo 'Testing...'
        // sh 'pip3 install -r requirements.txt'
        sh 'cp condor/condor/env_settings.py.ci condor/condor/env_settings.py'
        sh 'make check'
       // sh './condor/manage.py migrate'
        sh './condor/manage.py test'
     }
   }
   stage('Deploy') {
     steps {
       echo 'Deploying...'
       sh 'ansible-galaxy collection install community.general'
       sh 'make deploy'
   }
  }
}
}

