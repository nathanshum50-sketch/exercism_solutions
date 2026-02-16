function square_root(n)
    if n < 0 throw(DomainError("No real number returned.")) end
    if n <= 1 return n end
    max::Int128 = n ÷ 2
    min::Int128 = 1
    while max - min > 1
        bisect = (max-min) ÷ 2 + min
        estimate = bisect * bisect
        if estimate > n
            max = bisect
        elseif estimate < n
            min = bisect
        else
            return bisect
        end
    end
    if max * max > n return min end
    return max
end
