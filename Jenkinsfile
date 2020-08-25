pipeline{
    agent any
    environment { 
        registry = "gcr.io/cybage-devops/spring-boot-hello-world" 
        registryCredential = 'jenkins-argo-demo Google Container Registry Account' 
        dockerImage = '' 

    }
    
    tools{
        jdk 'java_home'
        maven 'maven_home'
    }
    
    stages{
        stage('git fetch'){
            steps{
                git branch: 'master', url: 'https://github.com/abhishekmha/springboot-hello-world.git'        
            }
        
        }
        stage('build'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('docker build'){
            steps{
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            }
        }
        stage('docker push'){
            steps{
                withCredentials([file(credentialsId: 'gcr_creds', variable: 'GC_KEY')]){
                    sh 'cat key.json | docker login -u _json_key --password-stdin https://gcr.io'
                    sh 'docker push gcr.io/cybage-devops/spring-boot-hello-world:$BUILD_NUMBER'
                }
                
            }
        }
        
        stage('deploy e2e'){
            steps{
                sh 'cd /home && git clone https://$git_username:git_password@github.com/abhishekmha/ArgoCD_CD.git'
                
                dir("ArgoCD_CD"){
                    sh "cd ./e2e && kustomize edit set image gcr.io/cybage-devops/spring-boot-hello-world:${env.GIT_COMMIT}"
                }
            }
        }
        
        
        
        
        
    }

}
