function today(birds_per_day)
    birds_per_day == [] && NULL
    return birds_per_day[end]
end

function increment_todays_count(birds_per_day)
    birds_per_day == [] && NULL
    birds_per_day[end] += 1
    return birds_per_day
end

function has_day_without_birds(birds_per_day)
    birds_per_day == [] && false
    return sum(birds_per_day .== 0) > 0
end

function count_for_first_days(birds_per_day, num_days)
    birds_per_day == [] || num_days <= 0 && 0
    count = 0
    for i in 1:num_days
        i > length(birds_per_day) && break
        count += birds_per_day[i]
    end
    return count
end

function busy_days(birds_per_day)
    birds_per_day == [] && 0
    return sum(birds_per_day .>= 5)
end

function average_per_day(week1, week2)
    week1 == [] || week2 == [] && NULL
    return (week1+week2)./2
end
