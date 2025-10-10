using Dates

function schedule_appointment(appointment::String)
    dtfmt = dateformat"mm/dd/yyyy HH:MM:SS"
    DateTime(appointment, dtfmt)
end

function has_passed(appointment::DateTime)
    return appointment - now() < Microsecond(0)
end

function is_afternoon_appointment(appointment::DateTime)
    return hour(appointment) >= 12 && hour(appointment) < 18
end

function describe(appointment::DateTime)
    weekday = Dates.dayname(appointment)
    monthname = Dates.monthname(appointment)
    day = Dates.day(appointment)
    year = Dates.year(appointment)
    time = Dates.format(appointment, "HH:MM")
    return "You have an appointment on $weekday, $monthname $day, $year at $time"
end

function anniversary_date()
    return Date(year(now()),09,15)
end
