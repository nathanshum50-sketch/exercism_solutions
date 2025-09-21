is_upper <- function(char) {
  grepl("[A-Z]",char)
}

acronym <- function(input) {
  if(input == "") {
    return("")
  }
  input <- toupper(input)
  output <- ""
  light <- TRUE
  for(a in 1:nchar(input)) {
    test <- substr(input,a,a)
    if(light == TRUE && is_upper(test)) {
      output <- paste0(output,test)
      light <- FALSE
    }
    else if(test == " " || test == "-") {
      light <- TRUE
    }
  }
  return(output)
}