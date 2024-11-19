pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage ("Clean up") {
            steps {
                deleteDir()
            }
        }

        stage ("Clone repo") {
            steps {
                sh 'git clone https://github.com/YassineBaccarr/jenkinsSpring2.git'
            }
        }

        stage("Generate backend image") {
            steps {
                dir('jenkinsSpring2') {  // Vérifiez si vous êtes dans le bon répertoire
                    sh 'ls -la'  // Vérifiez la structure des fichiers dans le répertoire actuel
                    sh 'mvn clean install'
                    // Si 'backend' est un sous-répertoire dans 'jenkinsSpring2', vérifiez qu'il existe
                    sh 'docker build -t backend '  // Assurez-vous que 'backend' est bien là
                }
            }
        }



        stage ("Run docker compose") {
            steps {
                dir('jenkinsSpring2') {
                    sh 'docker compose up -d'  // ou 'docker-compose up -d' selon la version de Docker Compose
                }
            }
        }
    }
}
