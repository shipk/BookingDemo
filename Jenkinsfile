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
            }
        }
        stage("mvn compile") {
            steps {
                echo " ============== mvn compile =================="
            }
        }
        stage("mvn package") {
            steps {
                echo " ============== mvn package =================="
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
        stage("mvn deploy_master") {
            when {
               expression { GIT_BRANCH ==~ /master/ }
            }

            steps {
                echo " ============== mvn deploy master =================="
            }
        }
    }
}