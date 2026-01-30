function eggcount(number)
    sum = 0
    while number > 0
        number%2 == 1 && (sum += 1)
        number = number ÷ 2
    end
    return sum
end
