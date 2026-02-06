function detect_anagrams(subject, candidates)
    subject = subject |> lowercase
    cleaned = lowercase.(candidates)
    return candidates .^ (anagram.(subject,cleaned)) |> filter(x->!isempty(x))
end

function anagram(first,second)
    first == second && return 0
    base = first |> collect |> sort |> join
    compare = second |> collect |> sort |> join
    return base == compare ? 1 : 0
end
