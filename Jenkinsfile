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
                dir('jenkinsSpring2') {  // Assurez-vous que vous êtes dans le bon répertoire
                    sh 'ls -la'  // Vérifiez la structure des fichiers dans le répertoire actuel
                    sh 'mvn clean install'  // Exécuter Maven pour construire le projet
                    // Si 'Dockerfile' est à la racine du répertoire cloné, utilisez '.'
                    sh 'docker build -t backend .'  // Utilisez '.' comme contexte si Dockerfile est à la racine du répertoire
                }
            }
        }

        stage ("Run docker compose") {
            steps {
                dir('jenkinsSpring2') {  // Assurez-vous que vous êtes toujours dans le bon répertoire
                    // Si vous utilisez Docker Compose, utilisez la commande correcte selon la version
                    sh 'docker compose up -d'  // ou 'docker-compose up -d' pour les anciennes versions
                }
            }
        }
    }
}
