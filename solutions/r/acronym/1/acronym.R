is_letter <- function(char) {
  grepl("[A-Za-z]", char)
}


acronym <- function(input) {
  if(input == "") {
    return("")
  }
  output <- ""
  light <- TRUE
  for(a in 1:nchar(input)) {
    test <- substr(input,a,a)
    if(light == TRUE && is_letter(test) == TRUE) {
      output <- paste(output,test,sep="")
      light <- FALSE
    }
    else if(test == " " || test == "-") {
      light <- TRUE
    }
  }
  output <- toupper(output)
  return(output)
}