function palindromeproducts(low::Int, high::Int, smallest::Bool)
    low > high && throw(ArgumentError("Error: lower bound is higher than upper bound"))
    base = [i for i in low:high]
    len = length(base)
    ver = reshape(base,(len,1))
    hor = reshape(base,(1,len))
    M = ver .* hor
    for i in CartesianIndices(M)
        if i[1] > i[2] || ispalindrome(M[i]) == false
            M[i] = 0
        end
    end
    max = maximum(M)
    palindrome = nothing
    factors = []
    max <= 0 && return palindrome, factors
    if smallest
        min = minimum(Iterators.filter(x -> x > 0, M))
        palindrome = min
        ind = findall(x -> x == min, M)
    else
        ind = findall(x -> x == max, M)
        palindrome = max
    end
    for x in ind
        new = (Tuple(x) |> collect) .+ (low-1)
        push!(factors,new)
    end
    palindrome, factors
end
        
function ispalindrome(prospect::Int)
    if (prospect % 10 == 0 && prospect != 0) || prospect < 0 return false end
    if prospect < 10 return true end
    reverse = 0
    while prospect > reverse
        reverse = reverse*10 + prospect%10
        prospect = prospect ÷ 10
    end
    return prospect == reverse || reverse ÷ 10 == prospect
end