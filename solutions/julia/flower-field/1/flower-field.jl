function annotate(arr)
    isempty(arr) && return arr
    vertical = length(arr)
    horizontal = length(arr[1])
    for v in 1:vertical
        clear = arr[v] |> collect
        for h in 1:horizontal
            base = clear[h]
            base == '*' && continue
            sum = 0
            min_h = max(1,h-1)
            max_h = min(horizontal,h+1)
            min_v = max(1,v-1)
            max_v = min(vertical,v+1)
            for a in min_v:max_v
                for b in min_h:max_h
                     sum += writer(arr[a][b])
                end
            end
            sum > 0 && (clear[h] = Char(sum + '0'))
        end
        arr[v] = clear |> join
    end
    return arr
end

writer(test) = test == '*' ? 1 : 0