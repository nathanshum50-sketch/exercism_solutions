StringOrMissing = Union{String,Missing}
IntOrNothing = Union{Int,Nothing}

@kwdef mutable struct Player
    name::StringOrMissing = missing
    level::Int64 = 0
    health::Int64 = 100
    mana::IntOrNothing = nothing
end

function introduce(player::Player)
    ismissing(player.name) && return "Mighty Magician"
    return player.name
end

function increment(mana::IntOrNothing)
    typeof(mana)==Int && return mana + 100
    return 50
end

function increment(name::StringOrMissing)
    typeof(name)==String && return name * " the Great"
    return "The Great"
end

function title!(player::Player)
    if player.level == 42
        player.name = increment(player.name)
    end
    return player.name
end

function revive!(player::Player)
    if player.health == 0
        player.health = 100
        player.mana = increment(player.mana)
    end
    return player
end
