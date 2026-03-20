# Change any of the following NamedTuple values to true to 
# enable testing different bonus tasks
tested_bonus_tasks = (rev = true, by = true, lt = true, multiple_matches = true)

function binarysearch(list = [],value = 0; rev = false, lt = <, by = identity)
    if isempty(list) return 1:0 end
    len = length(list)
    reverse = false
    if rev || (lt == >) && !(rev && (lt == >))
        list = [list[i] for i in len:-1:1]
        reverse = true
    end
    list = by.(list)
    value = by(value)
    low = 1
    high = len
    while high >= low
        middle = (low + high) ÷ 2
        test = list[middle]
        if test > value
            high = middle - 1
        elseif test < value
            low = middle + 1
        else
            low = middle
            high = middle
            while low > 1 && list[low-1] == test
                low -= 1
            end
            while high < len && list[high+1] == test
                high += 1
            end
            break
        end
    end
    if reverse return (len-high+1):(len-low+1) end
    return low:high
end