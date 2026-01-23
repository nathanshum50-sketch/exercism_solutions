function score(x, y)
    test = x^2 + y^2
    if test <= 1
        return 10
    elseif test <= 25
        return 5
    elseif test <= 100
        return 1
    end
    return 0
end
