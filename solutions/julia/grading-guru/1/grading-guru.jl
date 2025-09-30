function demote(n)
    if(n isa Float64)
        if(n%1==0)
            return convert(UInt8,n)
        end
        return convert(UInt8,div(n,1)+1)
    elseif(n isa Integer)
        return convert(Int8,n)
    else
        throw(MethodError(demote,(n,)))
    end
end

function preprocess(coll)
    if(coll isa Vector)
        coll = reverse(coll)
        return demote.(coll)
    elseif(coll isa Set)
        vector = collect(coll)
        vector = demote.(vector)
        return sort(vector, rev=true)
    else
        throw(MethodError(demote,(coll,)))
    end
end
