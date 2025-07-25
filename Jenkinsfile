pipeline {
    agent {
        label 'report'
    }
    stages {
        stage('Pull commit & restart container'){
            steps {
                script {
                    sh '''
                        cd /home/max/gencode/docker_gencode
                        ./config-gencode.sh
                    '''                    
                }
            }

        }
    }
}