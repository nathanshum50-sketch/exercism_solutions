"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""

function ispangram(input::String)::Bool
    unique_chars = Set(lowercase(input))
    if length(unique_chars) < 26
        return false
    end
    all_present = all(c -> c in unique_chars, 'a':'z')
    return all_present
end

