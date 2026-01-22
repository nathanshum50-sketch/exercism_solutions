function sortquantity!(qty)
    order = sortperm(qty, rev=true)
    sort!(qty, rev=true)
    return order
end

function sortcustomer(cust, srtperm)
    return cust[srtperm]
end

function production_schedule!(cust, qty)
    order = sortperm(qty, rev=true)
    cust = cust[order]
    sort!(qty, rev=true)
    len = length(order)
    new = Vector{Int64}(undef,len)
    for i in 1:len
        new[order[i]] = i
    end
    return (cust,new)
end
