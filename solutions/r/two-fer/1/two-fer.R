two_fer <- function(input=NA) {
  if (is.na(input)) {
    print("One for you, one for me.")
    reply <- ("One for you, one for me.")
  }
  else {
    sprintf("One for %s, one for me.", input)
    reply <- paste("One for ", input, ", one for me.", sep="")
  }
  return(reply)
}

enter <- readline()
two_fer(enter)