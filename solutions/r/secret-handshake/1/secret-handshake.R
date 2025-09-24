handshake <- function(n) {
  sequence = c()
  if(n>=1&&n<=15) {
    if(n%%2==1) {
      sequence <- sequence <- append(sequence, "wink", after=length(sequence))
    }
    n <- n%/%2
    if(n%%2==1) {
      sequence <- append(sequence, "double blink", after=length(sequence))
    }
    n <- n%/%2
    if(n%%2==1) {
      sequence <- append(sequence, "close your eyes", after=length(sequence))
    }
    n <- n%/%2
    if(n%%2==1) {
      sequence <- append(sequence, "jump", after=length(sequence))
    }
  }
  else if(16<=n&&n<=31) {
    if(n%%2==1) {
      sequence <- sequence <- append(sequence, "wink", after=0)
    }
    n <- n%/%2
    if(n%%2==1) {
      sequence <- append(sequence, "double blink", after=0)
    }
    n <- n%/%2
    if(n%%2==1) {
      sequence <- append(sequence, "close your eyes", after=0)
    }
    n <- n%/%2
    if(n%%2==1) {
      sequence <- append(sequence, "jump", after=0)
    }
  }
  return(sequence)
}