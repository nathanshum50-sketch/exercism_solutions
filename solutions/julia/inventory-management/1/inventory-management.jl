function create_inventory(items)
    inventory = Dict()
    items == [] && return inventory
    covered_positions = []
    for i in 1:length(items)
        i in covered_positions && continue
        item = items[i]
        k = 1
        if i < length(items)
          for j in (i+1):length(items)
              if items[j] == items[i]
                  k += 1
                  push!(covered_positions,j)
              end
          end
        end
        inventory[item] = k
    end
    return inventory
end

function add_items(inventory, items)
    for item in items
        if haskey(inventory,item)
            inventory[item] += 1
        else
            inventory[item] = 1
        end
    end
    return inventory
end

function decrement_items(inventory, items)
    for item in items
        if haskey(inventory,item) && inventory[item] > 0
            inventory[item] -= 1
        end
    end
    return inventory
end

function remove_item(inventory, item)
    delete!(inventory,item)
    return inventory
end

function list_inventory(inventory)
    inventory == Dict() && return []
    inventory = sort(collect(inventory),by = x->x[1])
    list = []
    for pair in inventory
        pair.second > 0 && push!(list,pair)
    end
    return list
end
