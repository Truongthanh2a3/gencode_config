pipeline {
    agent {
        label 'report'
    }
    stages {
        stage('Trigger Check') {
            when {
                expression {
                    // Chỉ chạy nếu là nhánh main
                    return params.ref == 'refs/heads/develop'
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
                        cd /home/max/gencode/dev_docker_gencode
                        ./config-dev-gencode.sh
                    '''                    
                }
            }

        }
    }
}