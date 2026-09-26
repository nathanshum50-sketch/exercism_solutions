function  combinations_in_cage(total, numsquares, restricted=nothing, digits=[1,2,3,4,5,6,7,8,9])
    mask = trues(length(digits))
    mask .&= (digits .<= total - numsquares + 1)
    if !isnothing(restricted)
        remove = Set(restricted)
        mask .&= .!(in.(digits, Ref(remove)))
    end
    digits = digits[mask]
    if numsquares <= 1
        if numsquares == 1 && total in digits
            return [[total]]
        else
            return []
        end
    end
    available = length(digits)
    if available <= numsquares
        if available == numsquares && sum(digits) == total
            return [digits]
        else
            return []
        end
    end
    permutable = digits[numsquares:end]
    known = length(permutable)
    selection = []
    new_square = numsquares-1
    for j in 1:known
        trial = permutable[j]
        new_total = total-trial
        new_digits = digits[1:numsquares+j-2]
        tests = combinations_in_cage(new_total,new_square,nothing,new_digits)
        if !isempty(tests)
            for test in tests
                push!(test,trial)
                push!(selection,test)
            end
        end
    end
    return sort(selection, by = x -> x[1])
end