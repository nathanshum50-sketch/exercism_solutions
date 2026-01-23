function encode(s)
    if isempty(s) return "" end
    output = ""
    count = 0
    store = s[1]
    for letter in s
        if letter == store
            count += 1
        else
            output = output * (count > 1 ? "$count" : "") * "$store"
            count = 1
            store = letter
        end
    end
    output = output * (count > 1 ? "$count" : "") * "$store"
    return output
end



function decode(s)
    if isempty(s) return "" end
    numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
    count = ""
    output = ""
    for letter in s
        if any(x -> x==letter,numbers)
            count = count * "$letter"
        else
            output = output * ("$letter" ^ (isempty(count) ? 1 : parse(Int,count)))
            count = ""
        end
    end
    return output
end
