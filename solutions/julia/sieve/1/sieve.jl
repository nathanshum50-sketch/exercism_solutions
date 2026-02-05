function sieve(limit)
    if limit <= 1 return [] end
    new = [2]
    if limit >= 3
        test = 3
        while test <= limit
            pass = true
            for prime in new
                if prime*prime > test break end
                if test%prime == 0
                    pass = false
                    break
                end
            end
            if pass push!(new,test) end
            test += 2
        end
    end
    return new
end
