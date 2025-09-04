function get_vector_of_wagons(args...)
    return collect(args)
end

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    return vcat(each_wagons_id[3],missing_wagons, each_wagons_id[4:end],each_wagons_id[1],each_wagons_id[2])
end

function add_missing_stops(route, stops...)
    new_route = Dict{String,Any}(route)
    new_route["stops"] = [last(p) for p in stops]
    return new_route
end

function extend_route_information(route; more_route_information...)
    new_route = Dict{Any,String}(route)
    for pair in more_route_information
        new_route[first(pair)] = last(pair)
    end
    return new_route
end
