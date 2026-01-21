function additems!(cart, items)
    for item in items
        given = get!(cart, item, 0)
        cart[item] = given+1
    end
    return cart
end

function update_recipes!(ideas, updates)
    merge!(ideas,updates)
end

function send_to_store(cart, aislecodes)
    new = Dict()
    for a in keys(aislecodes), b in keys(cart)
        if a == b
            new[aislecodes[a]] = cart[a]
        end
    end
    vector = new |> pairs |> collect
    sort(vector,by=p -> p.first)
end

function update_store_inventory!(inventory, cart)
    given = mergewith!(-,inventory,cart)
    new = Dict()
    for g in keys(given)
        if given[g] <= 0
            new[g] = 0
        end
    end
    return new
end

function reorder!(outofstock, stock)
    for out in keys(outofstock)
        if haskey(stock,out)
            outofstock[out] = stock[out]
        else
            outofstock[out] = 100
            stock[out] = 100
        end
    end
    return outofstock
end
