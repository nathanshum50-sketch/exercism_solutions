function dominoes(stones)
    isempty(stones) && return true
    track = length(stones)
    seed = [stones[end]]
    pop!(stones)
    perm = [(seed => stones)]
    for i in 1:(track-1)
        working = []
        for test in perm
            base = test[1]
            base_pile = test[2]
            ended = base[end][2]
            for j in 1:(track-i)
                prospect = base_pile[j]
                if ended == prospect[1]
                    new_base = vcat(base,[prospect])
                    new_pile = copy(base_pile)
                    deleteat!(new_pile,j)
                    push!(working,(new_base => new_pile))
                elseif ended == prospect[2]
                    new_base = vcat(base,[reverse(prospect)])
                    new_pile = copy(base_pile)
                    deleteat!(new_pile,j)
                    push!(working,(new_base => new_pile))
                end
            end
        end
        if isempty(working) return false end
        perm = working
    end
    for trial in perm
        sequence = trial[1]
        if sequence[1][1] == sequence[end][2]
            return true
        end
    end
    return false
end
