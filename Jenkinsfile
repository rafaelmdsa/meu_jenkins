pipeline {
    agent {
        docker {
            image 'ruby'
        }
    }

    stages {
        stage ('Build') {
            steps {
                echo 'Building or resolve dependencies?'
                sh 'bundle install'
            }
        }
        stage ('Test') {
            steps {
                echo 'Running regression tests'
                sh 'bundle exec cucumber -p ci'
            }
        }
        stage ('UAT') {
            steps {
                echo 'Wait for user acceptance'
                input(message: 'Go to production?', ok: 'Yes')
            }
        }
        stage ('Prod') {
            steps {
                echo 'Web app is ready'
            }
        }
    }
}
