struct ISBN
    number::String
    function ISBN(list::String)
        if isempty(list) throw(DomainError("Empty")) end
        upper = uppercase(list)
        cleaned = replace(upper,r"[^0-9A-Z]+" => "")
        ten = cleaned[end] == 'X'
        numbers = replace(cleaned,r"[^0-9]+" => "")
        testlen = length(numbers) + (ten ? 1 : 0)
        if testlen != 10 || cleaned != numbers * (ten ? "X" : "") throw(DomainError("Invalid specifications")) end
        transform = collect(range(10,stop=1,length=10))
        base = parse.(Int,collect(numbers))
        if ten push!(base,10) end
        trial = sum(transform .* base)
        if trial % 11 == 0
            return new(join(string.(base)))
        else
            throw(DomainError("Invalid number"))
        end
    end
end
