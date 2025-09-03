function get_coordinate(line)
    return line[2]
end

function convert_coordinate(coordinate)
    return Tuple(coordinate)
end

function compare_records(azara_record, rui_record)
    convert_coordinate(get_coordinate(azara_record)) == rui_record[2] && return true
    return false
end

function create_record(azara_record, rui_record)
    compare_records(azara_record, rui_record) && return (azara_record[2],rui_record[1],rui_record[3],azara_record[1])
    return ()
end
