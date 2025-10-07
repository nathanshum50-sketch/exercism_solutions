# define the TreasureChest{T} type
struct TreasureChest{T}
    password::String
    treasure::T
end

function get_treasure(password_attempt, chest)
    password_attempt != chest.password && return nothing
    return chest.treasure
end 

function multiply_treasure(multiplier, chest)
    return TreasureChest{Vector{typeof(chest.treasure)}}(chest.password,fill(chest.treasure,multiplier))
end
