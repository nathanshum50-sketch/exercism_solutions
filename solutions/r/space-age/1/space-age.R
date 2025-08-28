space_age <- function(seconds, planet) {
  planets <- c("mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", "neptune")
  if(!planet %in% planets || seconds < 0) {
    stop("Error: Invalid Planet")
  }
  orbital <- c(0.2408467,0.61519726,1.0000000,1.8808158,11.862615,29.447498,84.016846,164.79132)
  earth_year <- 31557600
  years <- seconds/earth_year
  for(i in 1:length(planets)) {
    if(planet == planets[i]) {
      space_age <- years/orbital[i]
      space_age <- round(space_age,2)
      return(space_age)
    }
  }
}