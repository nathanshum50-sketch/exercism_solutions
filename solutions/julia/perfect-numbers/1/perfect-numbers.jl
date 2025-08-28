function case(number)
    if number <= 0 || number != floor(number)
        throw(DomainError(number, "Invalid Input"))
    end
    number == 1 && return 0
    factor_sum = 1
    i = 2
    if mod(number,2) == 0
        while i*i <= number
            if mod(number,i) == 0
                factor_sum += i
                if i != number÷i 
                    factor_sum += number÷i
                end
            end
            i += 1
        end
    else
        i += 1
        while i*i <= number
            if mod(number,i) == 0
                factor_sum += i
                if i != number÷i 
                    factor_sum += number÷i
                end
            end
            i += 2
        end
    end
    return factor_sum
end

function isperfect(number)
    if number <= 0 || number != floor(number)
        throw(DomainError(number, "Invalid Input"))
    end
    return number == case(number)
end

function isabundant(number)
    if number <= 0 || number != floor(number)
        throw(DomainError(number, "Invalid Input"))
    end
    return number < case(number)
end

function isdeficient(number)
    if number <= 0 || number != floor(number)
        throw(DomainError(number, "Invalid Input"))
    end
    return number > case(number)
end