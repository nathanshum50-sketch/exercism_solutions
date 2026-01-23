"Different distances throw error; function counts from beginning to end of both strings of the same length, incrementing when differences are found."
function distance(a, b)
    stream = length(a)
    if stream != length(b) throw(ArgumentError("Strings not of equal length")) end
    increment = 0
    for i in 1:stream
        a[i] != b[i] && (increment+=1)
    end
    return increment
end
