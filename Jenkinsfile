pipeline {
    agent {
        label 'report'
    }
    stages {
        stage('Pull commit & restart container'){
            steps {
                script {
                    sh '''
                        cd /home/max/gencode/dev_docker_gencode
                        ./config-dev-gencode.sh
                    '''                    
                }
            }

        }
    }
}