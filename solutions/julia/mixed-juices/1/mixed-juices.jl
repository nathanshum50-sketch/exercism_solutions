function time_to_mix_juice(juice)
    if juice == "Pure Strawberry Joy"
        return 0.5
    elseif juice == "Energizer" || juice == "Green Garden"
        return 1.5
    elseif juice == "Tropical Island"
        return 3
    elseif juice == "All or Nothing"
        return 5
    else
        return 2.5
    end
end

function wedges_from_lime(size)
    if size == "small"
        return 6
    elseif size == "medium"
        return 8
    elseif size == "large"
        return 10
    else
        return 0
    end
end

function limes_to_cut(needed, limes)
    if isempty(limes) || needed <= 0
        return 0
    end
    total = 0
    i = 0
    for (idx,lime) in enumerate(limes)
        i = idx
        total += wedges_from_lime(limes[i])
        if total >= needed
            break
        end
    end
    return i
end

function order_times(orders)
    isempty(orders) && return []
    times = []
    for (i,order) in enumerate(orders)
        push!(times,time_to_mix_juice(orders[i]))
    end
    return times
end

function remaining_orders(time_left, orders)
    isempty(orders) && return []
    order_number = 1
    while time_left > 0 && order_number <= length(orders)
        time_left -= time_to_mix_juice(orders[order_number])
        order_number += 1
    end
    return orders[order_number:end]
end