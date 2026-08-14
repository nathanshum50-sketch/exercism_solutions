const LENGTH = 10

function generate_key()
    join(['a' + rand(0:25) for _ in 1:LENGTH])
end

struct Convert
    set::Char
end

#gives functor based on the char key

function (f::Convert)(x)
    shift = f.set - 'a'
    test = x + shift - 'z'
    if test > 0
        return 'a' + test - 1
    end
    return x + shift
end

function encode(plaintext, key)
    key = key |> collect
    transform = map(Convert,key)
    medium = collect(plaintext)
    full = length(medium)
    part = length(transform)
    #map array of functors to array of text chars
    if full > part
        value = full÷part
        remain = full%part
        if remain > 0
            next = vcat(repeat(transform,outer=value),transform[1:remain])
        else
            next = repeat(transform,outer=value)
        end
    else
        next = transform[1:full]
    end
    return map((f,x) -> f(x), next, medium) |> join
end

function decode(ciphertext, key)
    reverse = map(x -> 'a' + (26 - (x - 'a')) % 26,key) |> collect
    transform = map(Convert,reverse)
    medium = collect(ciphertext)
    full = length(medium)
    part = length(transform)
    #map array of functors to array of text chars
    if full > part
        value = full÷part
        remain = full%part
        if remain > 0
            next = vcat(repeat(transform,outer=value),transform[1:remain])
        else
            next = repeat(transform,outer=value)
        end
    else
        next = transform[1:full]
    end
    return map((f,x) -> f(x), next, medium) |> join
end