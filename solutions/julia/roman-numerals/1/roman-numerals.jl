function to_roman(number)
    if number <= 0 || number > 3999 throw(ErrorException("outside unit system")) end
    thos = number ÷ 1000
    huns = number % 1000 ÷ 100
    tens = number % 100 ÷ 10
    ones = number % 10
    return core(thos,"M","B","A") * core(huns,"C","D","M") * core(tens,"X","L","C") * core(ones,"I","V","X")
end

function core(number,one,five,ten)
    if number <= 3 return (one ^ number) end
    if number >= 5 && number <= 8 return five * (one ^ (number - 5)) end
    if number == 4 return one * five end
    return one * ten
end