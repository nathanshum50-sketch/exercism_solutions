# this is a stub function that takes a natural_number
# and should return the difference-of-squares as described
# in the README.md
difference_of_squares <- function(number) {
  if(is.null(number)||number < 0 || number%%1!=0) {
    return(-1)
  }
  sum <- number*(number+1)/2
  square_sum <- sum*sum
  sum_square <- number*(number+1)*(2*number+1)/6
  difference <- square_sum - sum_square
  return(difference)
}