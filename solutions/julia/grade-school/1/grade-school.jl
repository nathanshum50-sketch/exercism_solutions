# The new_school() function must return something that can be used in
# all the other functions.
# Programmers are free to choose a suitable implementation.

function new_school()
    return Dict()
end

function add!(students, school)
    list = []
    known = roster(school)
    for student in students
        grade = getfield(student,:grade)
        name = getfield(student,:name)
        if name in known
            push!(list,false)
            continue
        end
        if haskey(school,grade)
            push!(school[grade],name)
        else
            school[grade] = [name]
        end
        push!(list,true)
        push!(known,name)
    end
    return list
end

function grade(num, school)
    if haskey(school,num)
        return sort(school[num])
    end
    return []
end

function roster(school)
    call = sort(collect(school), by=first)
    return vcat((sort(each[2]) for each in call)...)
end
