StringOrMissing = Union{String,Missing}

@kwdef mutable struct Robot
    name::StringOrMissing = missing
end

histories = Set{String}()

function reset!(instance::Robot)
    instance.name = missing
end

function name(instance::Robot)
    if ismissing(instance.name)
        instance.name = new_name(histories)
        push!(histories,instance.name)
    end
    return instance.name
end

function new_name(exclude::Set{String})
    while true
        test = join(rand('A':'Z',2,1)) * lpad(string(rand(0:999)),3,"0")
        @show test
        if test in exclude 
            continue
        else
            return test
        end
    end
end