#!groovy
properties([disableConcurrentBuilds()])

pipeline {

    agent { 
        label 'master'
    }
    triggers { pollSCM('* * * * *')}
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
    }
   
    stages {
        stage("mvn clean") {
            steps {
                echo " ============== mvn clean =================="
                sh "mvn clean"
            }
        }
        stage("mvn compile") {
            steps {
                echo " ============== mvn compile =================="
                sh "mvn compile"
            }
        }

        stage("mvn package master") {
            when {
               expression { GIT_BRANCH ==~ /master/ }
            }
            steps {
                echo " ============== mvn package master =================="
                sh "mvn package -Dmaven.test.skip=true"
            }
        }
        stage("mvn package develop") {
            when {
               expression { GIT_BRANCH ==~ /develop/ }
            }
            steps {
                echo " ============== mvn package master =================="
                sh "mvn package -Dmaven.test.skip=true"
            }
        }

        stage("mvn deploy_master") {
            when {
               expression { GIT_BRANCH ==~ /master/ }
            }
            steps {
                echo " ============== mvn deploy master =================="
            }
        }
        stage("mvn deploy_develop") {
            when {
               expression { GIT_BRANCH ==~ /develop/ }
            }
            steps {
                echo " ============== mvn deploy develop =================="
            }
        }
    }
}
