nestedView('PT-Beta-Kops') {
   views {
           listView('PT_BE') {
                jobs {
                      names("example","test")
                }
                columns {
               status()
               weather()
               name()
               lastSuccess()
               lastFailure()
     }
   }
 }
}
