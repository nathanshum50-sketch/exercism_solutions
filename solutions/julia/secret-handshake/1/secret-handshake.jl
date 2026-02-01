function secret_handshake(code)
    command = code & 15
    convert = digits(command,base=2)
    while length(convert) < 4
        push!(convert,0)
    end
    output = ["wink","double blink", "close your eyes", "jump"] .^ convert
    @show code output
    output = filter(x->!isempty(x),output)
    code & 16 == 16 ? output |> reverse : output
end
