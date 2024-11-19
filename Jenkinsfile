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

        stage ("Generate backend image") {
            steps {
                // Exécuter Maven à la racine du projet, pas dans 'backend'
                dir('jenkinsSpring2') {  // S'assurer que nous sommes à la racine du projet
                    sh 'mvn clean install'
                    sh 'docker build -t backend ./backend'  // Construire l'image Docker à partir du dossier 'backend'
                }
            }
        }

        stage ("Run docker compose") {
            steps {
                dir('backend') {
                    sh 'docker compose up -d'  // ou 'docker-compose up -d' selon la version de Docker Compose
                }
            }
        }
    }
}
