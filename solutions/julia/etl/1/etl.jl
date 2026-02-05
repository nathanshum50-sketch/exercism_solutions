function transform(input::AbstractDict)
    new = Dict()
    for kv in input
        number = kv.first
        array = lowercase.(kv.second)
        for letter in array
            new[letter] = number
        end
    end
    return new
end

