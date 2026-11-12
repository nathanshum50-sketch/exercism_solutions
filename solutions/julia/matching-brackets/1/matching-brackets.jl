function matching_brackets(input_string)
    if isempty(input_string) return true end
    find = [only(bracket.match) for bracket in eachmatch(r"[(){}\[\]]",input_string)]
    if isempty(find) return true end
    order = []
    pairs = Dict(zip([')','}',']'],['(','{','[']))
    for f in find
        if haskey(pairs,f)
            if isempty(order) || order[end] != pairs[f] return false end
            pop!(order)
        else
            push!(order,f)
        end
    end
    return isempty(order)
end
