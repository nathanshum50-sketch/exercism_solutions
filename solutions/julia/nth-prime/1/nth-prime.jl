function prime(num)
    if num <= 1
        if num == 1
            return 2
        end
        throw(ErrorException("No such prime!"))
    end
    primes = [2]
    test = 3
    for i in 1:(num-1)
        while true
            potential = true
            for prime in primes
                if test%prime == 0
                    potential = false
                    break
                end
            end
            if potential break end
            test += 2
        end
        push!(primes,test) 
    end
    return primes[num]
end
