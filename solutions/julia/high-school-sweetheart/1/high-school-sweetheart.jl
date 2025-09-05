function cleanupname(name)
    return strip(replace(name,"-" => " "))
end

function firstletter(name)
    return string(cleanupname(name)[1])
end

function initial(name)
    return uppercase(firstletter(name))*"."
end

function couple(name1, name2)
    return string("❤ ",initial(name1),"  +  ",initial(name2)," ❤")
end
