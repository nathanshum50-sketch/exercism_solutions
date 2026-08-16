function ciphertext(plaintext)
    clean = replace(plaintext, r"[^a-zA-Z0-9]+" => "") |> lowercase
    clean == "" && return ""
    total = length(clean)
    lower = isqrt(total)
    upper = lower + 1
    storage = []
    contained = 0
    next = 1
    if total > lower*lower
        for i in 1:upper
            push!(storage,[clean[i]])
            contained += 1
        end
        #upper columns, upper rows or lower rows
        while contained < total
            set = contained%upper + 1
            push!(storage[set],clean[contained+1])
            contained += 1
        end
        next = (contained-1)%upper + 1
        while next+1 <= upper
            push!(storage[next+1],' ')
            next += 1
        end
    else
        for i in 1:lower
            push!(storage,[clean[i]])
            contained += 1
        end
        #lower columns, lower rows
        while contained < total
            set = contained%lower + 1
            push!(storage[set],clean[contained+1])
            contained += 1
        end
        next = (contained-1)%lower + 1
        while next+1 <= lower
            push!(storage[next+1],' ')
            next += 1
        end
    end
    return join(join.(storage)," ")
end
