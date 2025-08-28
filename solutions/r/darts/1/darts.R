score <- function(x, y) {
  if(x**2+y**2<=100) {
    if(x**2+y**2<=25) {
      if(x**2+y**2<=1) {
        return(10)
      }
      return(5)
    }
    return(1)
  }
  return(0)
}