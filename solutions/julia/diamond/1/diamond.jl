function rows(letter)
    letter = only(letter) |> uppercase
    if !(letter in 'A':'Z') return [] end
    if letter == 'A' return ["A"] end
    count = (letter - 'A') + 1
    length = 2*count-1
    status = Array{String}(undef,length)
    top = vcat([' ' for j in 1:(count-1)],['A'],[' ' for j in 1:(count-1)]) |> join
    status[1] = top
    status[end] = top
    status[count] = vcat([letter],[' ' for j in 1:(length - 2)],[letter]) |> join
    for i in 2:(count-1)
        outer = [' ' for j in 1:(count-i)]
        boundary = ['A'-1+i]
        inner = [' ' for j in 1:(2*i - 3)]
        exhibit = vcat(outer,boundary,inner,boundary,outer) |> join
        status[i] = exhibit
        status[length-i+1] = exhibit
    end
    return status
end
