# Determine whether the number is valid.
is_valid <- function(input) {
  input <- gsub(" ","",input)
  length <- nchar(input)
  if(grepl("[^0-9]",input)||length<=1) {
    return(FALSE)
  }
  input <- unlist(strsplit(input,""))
  sum <- 0
  for(i in 1:length) {
    if((length-i)%%2==1) {
      additive <- as.integer(input[i])*2
      if(additive > 9) {
        additive <- additive - 9
      }
      sum <- sum + additive
    }
    else {
      sum <- sum + as.integer(input[i])
    }
  }
  return(sum%%10==0)
}
