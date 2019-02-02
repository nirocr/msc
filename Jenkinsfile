pipeline {
  agent {
    node {
      label 'LGTM_GEN_WKR'
    }

  }
  stages {
    stage('Setup Worker') {
      steps {
        sh 'chmod a+x msc/deploy/tools/setupLGTMGenWkr.sh'
        sh 'sudo msc/deploy/tools/setupLGTMGenWkr.sh'
      }
    }
    stage('Holding Pattern') {
      steps {
        sh 'sleep 1d'
      }
    }
  }
}