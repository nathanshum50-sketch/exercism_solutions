function isisogram(s)
    s = s |> lowercase
    s = replace(s,r"[^a-z]" => "")
    c = s |> unique
    if isempty(c) return true end
    cleaned = String(c)
    return s == cleaned
end
