function transform(ch)
    if ch == '-'
        return "_"
    elseif ch == ' ' || isdigit(ch)
        return ""
    elseif isuppercase(ch)
        return "-"*lowercase(ch)
    elseif islowercase(ch) && ch - 'α' > 0 && ch - 'α' <= 24
        return "?"
    else
        return string(ch)
    end
end

function clean(str)
    return join([transform(ch) for ch in str],"")
end
