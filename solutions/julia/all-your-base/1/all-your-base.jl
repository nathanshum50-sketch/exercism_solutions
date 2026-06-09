# Implement number base conversion

function all_your_base(digits, base_in, base_out)
    if base_in < 2 || base_out < 2 throw(DomainError("Invalid base")) end
    spaces = length(digits)
    if spaces < 1 return [0] end
    digits_out = []
    total = 0
    for digit in digits
        if digit < 0 || digit >= base_in throw(DomainError("Unexpected negative digit")) end
        total += digit*base_in^(spaces-1)
        spaces -= 1
    end
    while total >= base_out
        space = total % base_out
        push!(digits_out,space)
        total = total ÷ base_out 
    end
    push!(digits_out,total)
    return reverse(digits_out)
end
