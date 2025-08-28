function get_item(stack, position)
    return stack[position]
end

function set_item!(stack, position, replacement_card)
    stack[position] = replacement_card
    return stack
end

function insert_item_at_top!(stack, new_card)
    push!(stack,new_card)
    return stack
end

function remove_item!(stack, position)
    deleteat!(stack,position)
    return stack
end

function remove_item_from_top!(stack)
    stack_tuple = tuple(x for x in stack)
    stack_temp = [i for i in stack_tuple]
    if pop!(stack) == stack_temp
        return []
    end
    return stack
end

function insert_item_at_bottom!(stack, new_card)
    pushfirst!(stack,new_card)
end

function remove_item_at_bottom!(stack)
    stack_tuple = tuple(x for x in stack)
    stack_temp = [i for i in stack_tuple]
    if deleteat!(stack,1) == stack_temp
        return []
    end
    return stack
end

function check_size_of_stack(stack, stack_size)
    if stack == []
        if stack_size == 0
            return true
        else
            return false
        end
    end
    size = 1
    while stack[size] != stack[end]
        size += 1
    end
    return size == stack_size
end
