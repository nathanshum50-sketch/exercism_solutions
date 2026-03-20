function score(dice, category)
    dice = sort(dice)
    keys = ["ones","twos","threes","fours","fives","sixes","full house","four of a kind","little straight","big straight","choice","yacht"]
    values = [(y -> y[y .== 1] |> sum),(y -> y[y .== 2] |> sum),(y -> y[y .== 3] |> sum),(y -> y[y .== 4] |> sum),(y -> y[y .== 5] |> sum),(y -> y[y .== 6] |> sum), (y -> y[1] != y[4] && y[2] != y[5] && length(unique(y)) == 2 ? sum(y) : 0), (y -> y[1] == y[4] || y[2] == y[5] ? (y[1] == y[4] ? 4*y[1] : 4*y[5]) : 0), (y -> y == [1,2,3,4,5] ? 30 : 0), (y -> y == [2,3,4,5,6] ? 30 : 0), (y -> sum(y)), (y -> length(unique(y)) == 1 ? 50 : 0)]
    choice = Dict(zip(keys,values))
    return choice[category](dice)
end

