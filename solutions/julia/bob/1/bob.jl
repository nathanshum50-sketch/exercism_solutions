function bob(stimulus)
    cleaned = strip(stimulus)
    if isempty(cleaned)
        return "Fine. Be that way!"
    elseif cleaned[end] == '?'
        if uppercase(cleaned) == cleaned && uppercase(cleaned) != lowercase(cleaned) return "Calm down, I know what I'm doing!" end
        return "Sure."
    elseif uppercase(cleaned) == cleaned && uppercase(cleaned) != lowercase(cleaned)
        return "Whoa, chill out!"
    end
    return "Whatever."
end
