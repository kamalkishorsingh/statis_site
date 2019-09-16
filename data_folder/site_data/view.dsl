nestedView('PT-Beta-Kops') {
   views {
           listView('PT_BE','test') {
                jobs {
                      names("example")
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
