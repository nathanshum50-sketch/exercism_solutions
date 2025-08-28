"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    square = convert(Int, n*n*(n+1)*(n+1)/4)
    return square
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    sum = convert(Int, n*(n+1)*(2n+1)/6)
    return sum
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    return square_of_sum(n) - sum_of_squares(n)
end
