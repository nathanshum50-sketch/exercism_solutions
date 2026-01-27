function acronym(phrase)
    sep = r"[\s-]+"
    remove = r"[^a-zA-Z\s-]"
    phrase = replace(phrase, remove => "")
    if isempty(phrase) return "" end
    token = split(phrase,sep)
    given = first.(token) |> join |> uppercase
end
