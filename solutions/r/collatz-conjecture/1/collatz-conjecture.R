collatz_step_counter <- function(n) {
  if(!is.numeric(n)||any(n%%1!=0)||any(n < 1)) {
    stop('Error: Invalid Number')
  }
  steps <- function(k) {
    m <- 0L
    while(k != 1L) {
      m <- m + 1L
      k <- if(k%%2L==0L) k%/%2L else k*3L + 1L
    }
    return(m)
  }
  vapply(n,steps,integer(1))
}