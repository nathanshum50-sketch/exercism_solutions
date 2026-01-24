function wordcount(sentence)
    sentence = sentence |> lowercase |> strip
    choice = split(sentence,r"[^\w']") |> filter(!isempty)
    base = Dict()
    for c in choice
        treated = strip(c,''')
        if !isempty(treated)
            haskey(base,treated) ? base[treated] += 1 : base[treated] = 1
        end
    end
    return base
end
