function clean(phone_number)
    cleaned = replace(phone_number, r"[^0-9]" => "")
    if length(cleaned) != 10
        if length(cleaned) != 11 || cleaned[1] != '1' throw(ArgumentError("Invalid phone number")) end
        cleaned = cleaned[2:end]
    end
    test = ['0','1']
    if cleaned[1] in test || cleaned[4] in test throw(ArgumentError("Invalid phone number")) end
    return cleaned
end
