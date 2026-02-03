function rotate(n, str)
    (str isa Char) && return click(str,n)
    new = []
    for symbol in str
        push!(new,click(symbol,n))
    end
    return new |> join
end

function click(letter, n)
    if letter in 'a':'z'
        return 'a' + ((n + (letter - 'a')) % 26)
    elseif letter in 'A':'Z'
        return 'A' + ((n + (letter - 'A')) % 26)
    end
    return letter
end