function print_name_badge(id, name, department)
    if(isnothing(department))
        department = "OWNER"
    else
        department = uppercase(department)
    end
    if(ismissing(id))
        return "$name - $department"
    end
    return "[$id] - $name - $department"
end

function salaries_no_id(ids, salaries)
    sum = 0
    ids = ismissing.(ids)
    add(a,b) = a && (sum += b)
    add.(ids,salaries)
    return sum
end
