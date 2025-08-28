raindrops <- function(number) {
  result <- ""
  if(number%%3==0) {
    result <- paste(result,"Pling",sep="")
  }
  if(number%%5==0) {
    result <- paste(result,"Plang",sep="")
  }
  if(number%%7==0) {
    result <- paste(result,"Plong",sep="")
  }
  else if(number%%5!=0&&number%%3!=0) {
    result <- sprintf("%d", number)
  }
  return(result)
}