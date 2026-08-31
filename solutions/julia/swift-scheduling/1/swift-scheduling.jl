using Dates

const weekdays = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
const dayend = [5,5,5,7,7,8,8]
const quarterend = [31,30,30,31]
function delivery_date(start, description)
    dtfmt = dateformat"yyyy-mm-ddTHH:MM:SS"
    datetime = DateTime(start,dtfmt)
    if description == "NOW"
        datetime += Hour(2)
        return Dates.format(datetime, "yyyy-mm-ddTHH:MM:SS")
    elseif description == "ASAP"
        hour = Dates.hour(datetime)
        if hour < 13
            time = "T17:00:00"
        else
            datetime += Day(1)
            time = "T13:00:00"
        end
        date = Dates.format(datetime, "yyyy-mm-dd")
        return date * time
    elseif description == "EOW"
        weekday = dayname(datetime)
        for i in 1:5
            if weekday == weekdays[i]
                increment = dayend[i] - i
                datetime += Day(increment)
                if i <= 3
                    time = "T17:00:00"
                else
                    time = "T20:00:00"
                end
                date = Dates.format(datetime,"yyyy-mm-dd")
                return date * time
            end
        end
        throw(ArgumentError("Not valid weekday"))         
    else
        month = match(r"(\d+)M",description)
        thismonth = Dates.month(datetime)
        thisyear = Dates.year(datetime)
        if isnothing(month)
            quarter = match(r"Q(\d+)",description)
            matches = collect(quarter.match)
            transform = join(matches[2:end])
            thatquarter = parse(Int,transform)
            if (thismonth-1) ÷ 3 + 1 > thatquarter
                thatyear = thisyear + 1
            else
                thatyear = thisyear
            end
            thatmonth = thatquarter*3
            provisional = DateTime(thatyear,thatmonth, quarterend[thatquarter],8)
            test = dayname(provisional)
            if test == "Saturday"
                provisional -= Day(1)
            elseif test == "Sunday"
                provisional -= Day(2)
            end
            return Dates.format(provisional,"yyyy-mm-ddTHH:MM:SS")
        end
        matches = collect(month.match)
        transform = join(matches[1:(end-1)])
        thatmonth = parse(Int,transform)
        if thismonth >= thatmonth
            thatyear = thisyear + 1
        else
            thatyear = thisyear
        end
        provisional = DateTime(thatyear,thatmonth,1,8)
        test = dayname(provisional)
        if test == "Saturday"
            provisional += Day(2)
        elseif test == "Sunday"
            provisional += Day(1)
        end
        return Dates.format(provisional,"yyyy-mm-ddTHH:MM:SS")
    end
end
