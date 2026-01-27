function triangle(n)
    if n < 0 throw(DomainError("Cannot be negative")) end
    total = []
    for i in 1:n
        horizontal = Vector{Int64}(undef,i)
        horizontal[1] = 1
        horizontal[i] = 1
        for h in 2:(i-1)
            horizontal[h] = factorial(i-1)/(factorial(h-1)*factorial(i-h))
        end
        push!(total,horizontal)
    end
    return total
end
