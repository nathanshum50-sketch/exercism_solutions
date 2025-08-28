function message(msg)
    message = strip(msg)
    vector = [String(x) for x in eachsplit(message, ": ")]
    deleteat!(vector,1)
    return strip(join(vector, " "))
end

function log_level(msg)
    message = strip(msg)
    vector = [String(x) for x in eachsplit(message, ": ")]
    return lowercase(filter(isletter,vector[1]))
end

function reformat(msg)
    message_text = message(msg)
    level = log_level(msg)
    return message_text*" ($level)"
end
