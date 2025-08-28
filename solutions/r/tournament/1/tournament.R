tournament <- function(input) {
  #Store statistics in list
  team_stats <- list()
  #Split input into processed parts
  for(match in input) {
    parts <- strsplit(match, ";")[[1]]
    if(length(parts) != 3||substr(match,nchar(match),nchar(match))==";") next
    team1 <- parts[1]
    team2 <- parts[2]
    result <- parts[3]
    #Treat input
    if(result %in% c("win", "loss", "draw")) {
      if(is.null(team_stats[[team1]])) {
        team_stats[[team1]] <- list(MP=0, W=0, D=0, L=0, P=0)
      }
      team_stats[[team1]]$MP <- team_stats[[team1]]$MP + 1
      if(is.null(team_stats[[team2]])) {
        team_stats[[team2]] <- list(MP=0, W=0, D=0, L=0, P=0)
      }
      team_stats[[team2]]$MP <- team_stats[[team2]]$MP + 1
      if(result == "win") {
        team_stats[[team1]]$W <- team_stats[[team1]]$W + 1
        team_stats[[team1]]$P <- team_stats[[team1]]$P + 3
        team_stats[[team2]]$L <- team_stats[[team2]]$L + 1
      }
      else if(result == "draw") {
        team_stats[[team1]]$D <- team_stats[[team1]]$D + 1
        team_stats[[team1]]$P <- team_stats[[team1]]$P + 1
        team_stats[[team2]]$D <- team_stats[[team2]]$D + 1
        team_stats[[team2]]$P <- team_stats[[team2]]$P + 1
      }
      else {
        team_stats[[team2]]$W <- team_stats[[team2]]$W + 1
        team_stats[[team2]]$P <- team_stats[[team2]]$P + 3
        team_stats[[team1]]$L <- team_stats[[team1]]$L + 1
      }
    }
  }
  #Convert to dataframe
  result <- do.call(rbind,lapply(names(team_stats),function(team){
    stats <- team_stats[[team]]
    data.frame(
      Team = team,
      MP = stats$MP,
      W = stats$W,
      D = stats$D,
      L = stats$L,
      P = stats$P,
      stringsAsFactors=FALSE
    )}))
  #Order result
  result <- result[order(-result$P,-result$W,result$Team),]
  rownames(result) <- NULL
  return(result)
}