function largest_product(str, span)
    space = length(str)
    if space < span throw(ArgumentError("Series length longer than input")) end
    if span <= 0
        span == 0 && return 0
        throw(ArgumentError("Invalid span"))
    end
    times = space - span + 1
    all = [parse(Int,s) for s in str]
    max = 0
    for i in 1:times
        base = all[i]
        for j in 1:(span-1)
            base *= all[i+j]
        end
        if base > max max = base end
    end
    return max
end
