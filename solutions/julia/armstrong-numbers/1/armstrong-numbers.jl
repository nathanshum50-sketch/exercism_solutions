function isarmstrong(n)
    if n == 0 return true end
    digits = []
    channel = n
    while channel >= 1
        push!(digits,channel%10)
        channel = channel ÷ 10
    end
    power = length(digits)
    new = digits .^ power
    return sum(new) == n
end
