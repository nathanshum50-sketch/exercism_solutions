const m = 26
const sep = 5

function factors(number)
    top = isqrt(number)
    out = []
    number <= 3 && return out
    for i in 2:top
        dividend = number ÷ i
        if dividend == number / i
            push!(out,i)
            i != dividend && push!(out,dividend)
        end
    end
    return sort(out)
end

const tests = factors(m)

function coprime(x)
    for test in tests
        if x % test == 0
            throw(ArgumentError("Not coprime $x & $m"))
        end
    end
end

function encode(plaintext, a, b)
    coprime(a)
    clean = lowercase.(collect(replace(plaintext, r"[^0-9a-zA-Z]+" => "")))
    new = map(x -> isdigit(x) ? x : ((x - 'a')*a + b) % m + 'a', clean)
    final = join([String(new[i:min(i+sep-1,end)]) for i in 1:sep:length(new)], " ")
    return final
end

function mmi(a)
    for n in 1:m
        if a*n % m == 1
            return n
        end
    end
    throw(ArgumentError("Preset error"))
end

function decode(ciphertext, a, b)
    coprime(a)
    clean = lowercase.(collect(replace(ciphertext, r"[^0-9a-zA-Z]+" => "")))
    inv = mmi(a)
    new = map(x -> isdigit(x) ? x : ((x - 'a') - b)*inv % m >= 0 ? ((x - 'a') - b)*inv % m + 'a' : ((x - 'a') - b)*inv % m + m + 'a', clean) |> join
    return new
end
