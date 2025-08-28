function rank_range()
    return 1:8
end

function file_range()
    return 'A':'H'
end

function ranks()
    ranks = collect(rank_range())
    return ranks
end

function files()
    ranks = collect(file_range())
    return ranks
end
