setClass("isosceles", representation(sides="numeric"))
setClass("equilateral", contains = "isosceles")
setClass("scalene", representation(sides="numeric"))

triangle <- function(x, y, z) {
  triangle <- c(x,y,z)
  if(x <= 0 || y <= 0 || z <= 0 || x+y < z || y+z < x || x+z < y) {
    stop("Not a triangle")
  } else if(x == y && x == z) {
    new("equilateral",sides=triangle)
  } else if(x == y || x == z || y == z) {
    new("isosceles",sides=triangle)
  } else {
    new("scalene",sides=triangle)
  }
}
