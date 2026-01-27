function prime_factors(n)
    primes = []
    prospect = 3
    while n > 1
        while n%2 == 0
            push!(primes,2)
            n = n/2
        end
        if n <= 1 return primes end
        if n%prospect == 0
            push!(primes,prospect)
            n = n/prospect
            prospect = 3
            continue
        end
        prospect += 2
    end
    return primes
end
