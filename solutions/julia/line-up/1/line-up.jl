function line_up(name, number)
    value = number%10
    place = (number%100 - value == 10)
    if place
        ordinal = "th"
    else
        ordinal = value == 1 ? "st" : value == 2 ? "nd" : value == 3 ? "rd" : "th"
    end
    return "$name, you are the $number$ordinal customer we serve today. Thank you!"
end
