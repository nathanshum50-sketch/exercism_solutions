function collatz_steps(n)
    n < 1 && throw(DomainError("Not a positive integer"))
    n == 1 && return 0
    steps = 0
    while n != 1
        steps += 1
        mod(n,2) == 1 ? n = n*3 + 1 : n = n/2
    end
    return steps
end
