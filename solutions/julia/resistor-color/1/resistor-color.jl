function colorcode(color)
    coloring = Dict("black" => 0, "brown" => 1, "red" => 2, "orange" => 3, "yellow" => 4, "green" => 5, "blue" => 6, "violet" => 7, "grey" => 8, "white" => 9)
    return coloring[color]
end

function colors()
    coloring = Dict("black" => 0, "brown" => 1, "red" => 2, "orange" => 3, "yellow" => 4, "green" => 5, "blue" => 6, "violet" => 7, "grey" => 8, "white" => 9)
    colored = collect(coloring)
    colored = sort(colored,by = x->x[2])
    return first.(colored)
end