number_type <- function(n){
  if(n <= 0 || n%%1!=0) {
    stop("Domain Error: Not a natural number.")
  }
  if(n <= 3 || n == 5 || n==7) {
    return("deficient")
  }
  max <- 2
  while(max*max <= n) {
    max <- max + 1
  }
  max <- max - 1
  square <- max*max == n
  factors <- 1
  if(n%%2!=0) {
    for(i in seq(3,max,2)) {
      if(n%%i==0) {
        factors <- factors + i
        if(!square||i!=max) {
          factors <- factors + n%/%i
        }
      }
    }
  }
  else {
    for(i in 2:max) {
      if(n%%i==0) {
        factors <- factors + i
        if(!square||i!=max) {
          factors <- factors + n%/%i
        }
      }
    }
  }
  if(factors > n) {
    return("abundant")
  }
  else if(factors < n) {
    return("deficient")
  }
  else {
    return("perfect")
  }
}
