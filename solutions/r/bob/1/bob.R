bob <- function(input) {
  input <- trimws(input, which="both")
  if(input=="") {
    return("Fine. Be that way!")
  }
  length <- nchar(input)
  split <- unlist(strsplit(input,""))
  if(!grepl("[a-z]",input)&&grepl("[A-Z]",input)) {
    if(split[length]=="?") {
      return("Calm down, I know what I'm doing!")
    }
    return("Whoa, chill out!")
  }
  if(split[length]=="?") {
    return("Sure.")
  }
  return("Whatever.")
}
