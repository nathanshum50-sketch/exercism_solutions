function clothingitem(categories, qualities)
    Dict(categories[i] => qualities[i] for i in 1:length(categories))
end

function get_combinations(tops, bottoms)
    [(top,bottom) for top in tops, bottom in bottoms]
end

function get_prices(combos)
    [top["price"] + bottom["price"] for (top,bottom) in combos]
end

function filter_clashing(combos)
    [tuple for tuple in combos if tuple[1]["base_color"] != tuple[2]["base_color"]]
end
