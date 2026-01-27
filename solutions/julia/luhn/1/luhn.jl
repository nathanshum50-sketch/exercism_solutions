function luhn(cardnum)
    cleaned = replace(cardnum, r"\s" => "")
    given = length(cleaned)
    if given <= 1 || contains(cleaned,r"[^0-9]") return false end
    increment = 0
    for n in 1:given
        basic = parse(Int,cleaned[given-n+1])
        if n%2 == 0
            basic = basic*2
            if basic > 9 basic -= 9 end
        end
        increment += basic
    end
    return increment%10 == 0
end
