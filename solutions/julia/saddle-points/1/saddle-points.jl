function saddlepoints(M)
    result = []
    if isempty(M) return NTuple{2,Int}[] end
    intermediate = Dict()
    collen = size(M,1)
    for j in axes(M,2)
        col = M[:,j]
        base = minimum(col)
        for k in 1:collen
            if col[k] == base
                if haskey(intermediate,k)
                    change = intermediate[k]
                    push!(change,j)
                    intermediate[k] = change
                else
                    intermediate[k] = [j]
                end
            end
        end
    end
    for k in keys(intermediate)
        line = intermediate[k]
        base = maximum(M[k,:])
        for j in line
            if M[k,j] == base
                push!(result,(k,j))
            end
        end
    end
    return sort!(result, by = x -> x[1])
end
