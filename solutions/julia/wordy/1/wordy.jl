function wordy(problem)
    clean = problem[9:end-1]
    separate = split(clean,r"\s+") |> collect
    for note in separate
        if occursin(r"[0-9]",note) break end
        popfirst!(separate)
    end
    if isempty(separate) throw(ArgumentError("Invalid statement")) end
    digit = true
    base = 0
    operation = nothing
    for symbol in separate
        if digit
            if symbol == "by" continue end
            combination = tryparse(Int,symbol)
            if combination != nothing
                if operation != nothing
                    base = operation(base,combination)
                else
                    base = combination
                end
            else
                throw(ArgumentError("Invalid object"))
            end
            digit = false
            operation = nothing
        else
            operation = symbol_change(symbol)
            digit = true
        end
    end
    if digit == true
        throw(ArgumentError("Extra term"))
    else
        return base
    end
end

function symbol_change(string)
    if string == "plus"
        return (x::Number,y::Number) -> x + y
    elseif string == "minus"
        return (x::Number,y::Number) -> x - y
    elseif string == "multiplied"
        return (x::Number,y::Number) -> x * y
    elseif string == "divided"
        return (x::Number,y::Number) -> x / y
    end
    throw(ArgumentError("Invalid operation"))
end