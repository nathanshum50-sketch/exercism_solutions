function message(msg)
    vector = [String(x) for x in eachsplit(msg, ": ")]
    deleteat!(vector,1)
    return strip(join(vector, " "))
end

function log_level(msg)
    vector = [String(x) for x in eachsplit(msg, ": ")]
    return lowercase(filter(isletter,vector[1]))
end

function reformat(msg)
    message_text = message(msg)
    level = log_level(msg)
    return message_text*" ($level)"
end
