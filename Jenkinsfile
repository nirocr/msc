pipeline {
  agent {
    node {
      label 'LGTM_GEN_WKR'
    }

  }
  stages {
    stage('Setup Worker') {
      steps {
        sh 'ls -al'
        sh 'chmod a+x deploy/tools/setupLGTMGenWkr.sh'
        sh 'sudo deploy/tools/setupLGTMGenWkr.sh'
      }
    }
    stage('Holding Pattern') {
      steps {
        sh 'sleep 1d'
      }
    }
  }
}