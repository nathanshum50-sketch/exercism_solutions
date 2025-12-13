const first = [0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0]
const edge1 = [0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0]
const edge2 = [0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0]
const info = [0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0]
const edge = [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1]
const edge3 = [0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0]
const edge4 = [0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0]
const edge5 = [0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0]
const E = [first; edge1; edge2; info; edge1; edge; edge3; edge4; edge5; edge1; first]

frown!(E) = E[:] = E[[1,2,3,4,5,6,9,8,7,10,11],:]

frown(E) = E[[1,2,3,4,5,6,9,8,7,10,11],:]

stickerwall(E) = vcat(hcat(E, frown(E)), ones(1,36), hcat(frown(E),E))

colpixelcount(E) = E .* sum(E; dims=1)

render(E) = join([join([given == 0 ? ' ' : 'X' for given in row],"") for row in eachrow(E)],"\n")
