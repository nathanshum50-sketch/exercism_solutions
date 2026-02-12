function recite(pieces)
    isempty(pieces) && return ""
    first = pieces[1]
    last = "And all for the want of a $first."
    if length(pieces) >= 2
        chorus = verse.(pieces[1:(end-1)],pieces[2:end])
        return join(chorus,"\n") * "\n" * last
    end
    return last
end

function verse(original,pertinent)
    return "For want of a $original the $pertinent was lost."
end