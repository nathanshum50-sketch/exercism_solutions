function encode(input)
    input = lowercase(input)
    input = replace(input,r"[^a-z0-9]" => "")
    if isempty(input) return input end
    output = map(x -> x in 'a':'z' ? 'a' + ('z' - x) : x,input) |> collect
    len::Integer = (length(output) - 1) ÷ 5
    for i in 1:len
        insert!(output,i*6,' ')
    end
    return join(output)
end

function decode(input)
    input = lowercase(input)
    input = replace(input,r"\s" => "")
    if isempty(input) return input end
    output = map(x -> x in 'a':'z' ? 'a' + ('z' - x) : x,input) |> join
    output
end

