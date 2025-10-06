# define the Coord type
struct Coord
    x::UInt16
    y::UInt16
end
# define the Plot keyword type
@kwdef struct Plot
    bottom_left::Coord
    top_right::Coord
end

function is_claim_staked(claim::Plot, register::Set{Plot})
    isempty(register) && return false
    for registration in register
        if (registration.bottom_left.x < claim.top_right.x) && (registration.bottom_left.y < claim.top_right.y) && (claim.bottom_left.x < registration.top_right.x) && (claim.bottom_left.y < registration.top_right.y)
            return true
        end
    end
    return false
end

function stake_claim!(claim::Plot, register::Set{Plot})
    if(!is_claim_staked(claim,register))
        push!(register,claim)
        return true
    end
    return false
end

function get_longest_side(claim::Plot)
    return max(claim.top_right.x - claim.bottom_left.x,claim.top_right.y - claim.bottom_left.y)
end

function get_claim_with_longest_side(register::Set{Plot})
    isempty(register) && return nothing
    sides = collect(register)
    maxes = get_longest_side.(sides)
    highest = maximum(maxes)
    longest = Set()
    for i in 1:length(sides)
        if maxes[i] == highest
            push!(longest,sides[i])
        end
    end
    return longest
end
