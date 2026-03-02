function matrix(strmatrix)
    strmatrix = replace(strmatrix,r"[^\d\s]+" => "")
    newer = split(strmatrix,"\n")
    new = split.(newer,r"\s+")
    rows = [parse.(Int,novel) for novel in new]
    width = length(rows[1])
    height = length(rows)
    columns = [Vector{Int}(undef,height) for _ in 1:width]
    for w in 1:width
        for h in 1:height
            columns[w][h] = rows[h][w]
        end
    end
    rows, columns
end
