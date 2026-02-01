function translate(phrase)
    phrase = phrase |> lowercase
    group = split(phrase, r"[^a-z]+")
    group = filter(x -> !isempty(x),group)
    return join([convert(word) for word in group], " ")
end

function convert(word)
    vowels = "aeiou"
    participants = length(word)
    if word[1] in vowels
        return word * "ay"
    elseif participants >= 2
        first = word[1:2]
        if first == "xr" || first == "yt" return word * "ay" end
        rule_three = split(word,"qu")
        creation = rule_three[1]
        for test in 2:length(creation)
            if creation[test] in "aeiouy"
                return word[test:end] * word[1:(test-1)] * "ay"
            end
        end
        return join(rule_three[2:end],"qu") * rule_three[1] * "quay"
    else
        return word * "ay"
    end 
end