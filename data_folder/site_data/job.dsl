mavenJob('maven_beta') {
  description('I\'ll do continuous API deployment of all componets availble in KK_Backend.')
  disabled()
  logRotator {
      daysToKeep(60)
      numToKeep(20)
      artifactDaysToKeep(1)
  }
       parameters {
        stringParam('BRANCH', 'master')
         
    }

    concurrentBuild(true)
        
    scm {
        git {
          branch ('${BRANCH}\n')

      remote {
        url("https://github.com/kamalkishorsingh/Spring3HibernateApp.git")
          credentials('kamalkishorsingh')
    }     
     }
}



wrappers {
        maskPasswordsBuildWrapper {

    varPasswordPairs {
        varPasswordPair {
            var("dbpass")
            password("p1")
        }
      
      varPasswordPair {
            var("token")
            password("p1")
        }
      
            varPasswordPair {
            var("access")
            password("p1")
        }
      
            varPasswordPair {
            var("secret")
            password("p1")
        }
      
    }
} 
    }

  preBuildSteps {
    shell('bash /var/lib/jenkins/BE_api/beta_api_petra.sh  ${access} ${secret}')
    }
  
  goals('-DskipTests clean install -U  -P release')
    rootPOM('pom.xml')
    postBuildSteps('SUCCESS') {

        shell('echo $BRANCH')

    }
}
