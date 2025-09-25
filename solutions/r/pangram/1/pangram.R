is_pangram <- function(input) {
  input <- tolower(input)
  for(i in letters) {
    if(!grepl(i,input)) return(FALSE)
  }
  return(TRUE)
}
