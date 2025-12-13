const first = [0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0]
const edge1 = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0]
const edge2 = [0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0]
const info = [0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0]
const edge = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1]
const edge3 = [0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0]
const edge4 = [0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0]
const edge5 = [0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0]
const all = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
const E = [first; edge1; edge2; info; edge1; edge; edge3; edge4; edge5; edge1; first]

function frown!(E)
    E[7, :] = edge5
    E[8, :] = edge4
    E[9, :] = edge3
    return E
end

function frown(E)
    A = E[:, :]
    A[7, :] = edge5
    A[8, :] = edge4
    A[9, :] = edge3
    return A
end

function stickerwall(E)
    return vcat(hcat(E, frown(E)), all, hcat(frown(E),E))
end

function colpixelcount(E)
    return E .* sum(E; dims=1)
end

function render(E)
    A = E[:, :]
    return join([join([given == 0 ? ' ' : 'X' for given in row],"") for row in eachrow(A)],"\n")
end
