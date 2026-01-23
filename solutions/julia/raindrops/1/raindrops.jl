function raindrops(number)
    bein = ""
    if number%3 == 0 bein = bein * "Pling" end
    if number%5 == 0 bein = bein * "Plang" end
    if number%7 == 0 bein = bein * "Plong" end
    bein == "" && return "$number"
    return bein
end
