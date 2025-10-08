struct InvalidPosition <: Exception
    msg::String
end

struct Queen
    x::Int
    y::Int
    function Queen(x::Int,y::Int)
        position = inbounds([x,y])
        !all(position) && throw(InvalidPosition(join(position,"; ")))
        new(x,y)
    end
end

inbounds(a::Int) = a >= 0 && a <= 7
inbounds(a::Vector{Int}) = all(inbounds.(a))

function canattack(white::Queen, black::Queen)
    white.x == black.x && white.y == black.y && throw(InvalidPosition("Same position."))
    return white.x == black.x || white.y == black.y || abs(white.x - black.x) == abs(white.y - black.y)
end
