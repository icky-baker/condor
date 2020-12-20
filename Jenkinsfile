/*
билд:
1.гитхаб релиз
2. апдейт реквайрементсов

В тест стейдже надо сделать
1. Чекаут кода
2. pip install -r requirements.txt
3. make lint

В моем понимании деплой стейдж это
1. Клон (git pull)
2. Можно чекнуть пингом сервера
3. make deploy
*/

pipeline {
   agent any
   stages {
      stage('Build') {
        steps {
          echo 'Building...'
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
