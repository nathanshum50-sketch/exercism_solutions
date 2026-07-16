function meetup(year, month, week, dayofweek)
    base = Date(year,month,chooseweek(year,month,week))
    solution = base |> Dates.dayname |> chooseday
    difference = chooseday(dayofweek) - solution
    return base + Day((7+difference)%7)
end

function chooseweek(year, month, week)
    weeks = ["teenth","first","second","third","fourth","last"]
    known = choosemonth(year,month)
    results = [13,1,8,15,22,known]
    transform = Dict(zip(weeks,results))
    return transform[week]
end

function choosemonth(year, month)
    if month == 2
        return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) ? 23 : 22
    end
    last = [25,22,25,24,25,24,25,25,24,25,24,25]
    return last[month]
end

function chooseday(dayname)
    days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    i = 1
    for day in days
        if day == dayname return i end
        i += 1
    end
end