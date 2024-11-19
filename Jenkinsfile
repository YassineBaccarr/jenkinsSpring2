pipeline {
    agent any
    tools {
        maven 'maven' // Assurez-vous que le nom correspond à celui configuré dans Jenkins.
    }
    stages {
        stage("Clean up") {
            steps {
                deleteDir() // Nettoie le répertoire de travail.
            }
        }
        stage("Clone repo") {
            steps {
                // Ajoutez des credentials si le dépôt est privé.
                script {
                    checkout([$class: 'GitSCM',
                        branches: [[name: '*/main']],
                        userRemoteConfigs: [[
                            url: 'https://github.com/YassineBaccarr/jenkinsSpring2.git',
                            credentialsId: 'your-credentials-id' // Remplacez par l'ID de vos credentials si nécessaire.
                        ]]
                    ])
                }
            }
        }
        stage("Generate backend image") {
            steps {
                dir("backend") {
                    sh "mvn clean install" // Compile et package l'application avec Maven.
                    sh "docker build -t backend:latest ." // Crée une image Docker avec un tag 'latest'.
                }
            }
        }
        stage("Run docker compose") {
            steps {
                dir("backend") {
                    // Vérifiez que le fichier docker-compose.yml existe dans le répertoire backend.
                    sh "docker compose up -d" // Lance les conteneurs en arrière-plan.
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline terminé, nettoyage possible si nécessaire.'
        }
        success {
            echo 'Pipeline exécuté avec succès !'
        }
        failure {
            echo 'Le pipeline a échoué.'
        }
    }
}
