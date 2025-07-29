pipeline {
    agent {
        label 'report'
    }
    stages {
        stage('Commit container to iamges'){
            steps{
                script{
                    sh '''
                    docker commit nginx-php-fpm-82 nginx-php-fm-82
                    docker push 
                    '''
                }
            }
        }
        stage('Trigger Check') {
            when {
                expression {
                    // Chỉ chạy nếu là nhánh main
                    return params.ref == 'refs/heads/main'
                }
            }
            steps {
                echo "Webhook from ${params.ref}, job is triggered."
            }
        }
        
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