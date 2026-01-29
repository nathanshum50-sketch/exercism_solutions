function sum_of_multiples(limit, factors)
    if limit <= 1 return 0 end
    factors = factors |> unique |> filter(!iszero) |> sort
    known = length(factors)
    base = 0
    for a in 1:known
        independent = true
        factor = factors[a]
        test = factor
        while limit > test
            pass = true
            if a > 1
                for b in 1:(a-1)
                    if factor%factors[b] == 0
                        independent = false
                        break
                    end
                    if test%factors[b] == 0
                        pass = false
                        break
                    end
                end
            end
            if !independent break end
            if pass base += test end
            test += factor
        end
    end
    return base
end