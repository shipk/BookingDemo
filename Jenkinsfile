#!groovy
properties([disableConcurrentBuilds()])

pipeline {

    agent { 
        label 'master'
    }
    //triggers { pollSCM('* * * * *')}
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
    }
   
    stages {

        stage("Build") {
            steps {
                echo " ============== mvn package master =================="
                sh "mvn clean package -Dmaven.test.skip=true"
            }
        }

        stage("Test") {
            when {
                expression { GIT_BRANCH ==~ /develop/ }
            }
            steps {
                echo " ============== mvn package develop =================="
                sh "mvn test"
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml' 
                }
            }
}
        stage("Deploy") {
            when {
               expression { GIT_BRANCH ==~ /master/ }
            }
            steps {
                echo " ============== mvn deploy master =================="
                sh '''#!/bin/bash 
                    ./bd_stop_n_start_war.sh > /tmp/bd_stop_n_start.out &
                '''
            }
        }
    }
}
