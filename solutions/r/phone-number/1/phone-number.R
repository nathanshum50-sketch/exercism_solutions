parse_phone_number <- function(number_string) {
  end <- gsub("[[:punct:][:blank:][a-zA-Z]", "", number_string)
  if(substr(end,1,1)=="1") {
    end <- substr(end,2,nchar(end))
  }
  if(substr(end,1,1)=="0"||substr(end,1,1)=="1"||substr(end,4,4)=="0"||substr(end,4,4)=="1"||nchar(end)!=10) {
    return(NULL)
  }
  return(end)
}