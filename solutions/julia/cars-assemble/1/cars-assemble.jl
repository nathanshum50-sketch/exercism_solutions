const production_unit_hour = 221

function success_rate(speed)
    if speed == 0
        return 0
    elseif speed >= 1 && speed <= 4
        return 1
    elseif speed >= 5 && speed <= 8
        return 0.9
    elseif speed == 9
        return 0.8
    elseif speed == 10
        return 0.77
    else
        return -1
    end
end

production_rate_per_hour(speed) = speed*production_unit_hour*success_rate(speed)

working_items_per_minute(speed) = Int(production_rate_per_hour(speed)÷60)