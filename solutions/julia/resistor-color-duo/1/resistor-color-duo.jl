const CODE = Dict(
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white"=>9
)



function colorcode(colors)
    isempty(colors) && return 0
    list = haskey.(Ref(CODE),colors)
    increment = 0
    position = 0
    for place in 1:length(colors)
        if list[place]
            if position == 0
                increment += 10*CODE[colors[place]]
                position += 1
                continue
            end
            return increment + CODE[colors[place]]
        end
    end
    throw(ArgumentError("Insufficient valid colors"))
end

