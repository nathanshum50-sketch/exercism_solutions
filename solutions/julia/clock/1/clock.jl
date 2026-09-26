using Dates
# define the Clock type
struct Clock
    hour::Int
    minute::Int
    function Clock(hour::Int,minute::Int)
        hour += minute ÷ 60
        minute = minute % 60
        if minute < 0
            minute += 60
            hour -= 1
        end
        hour = hour % 24
        if hour < 0 hour += 24 end
        return new(hour,minute)
    end
end

#arithmetic with Dates.Minute
Base.:+(x::Clock,y::Minute) = Clock(x.hour,x.minute+y.value)
Base.:+(y::Minute,x::Clock) = x + y
Base.:-(x::Clock,y::Minute) = Clock(x.hour,x.minute-y.value)
Base.:-(y::Minute,x::Clock) = Clock(x.hour,y.value-x.minute)

#equality of clocks
Base.:(==)(x::Clock,y::Clock) = x.hour == y.hour && x.minute == y.minute
Base.:(!=)(x::Clock,y::Clock) = !(x == y)

#displaying clock
Base.show(io::IO,x::Clock) = print(io,"\"$(lpad(x.hour,2,'0')):$(lpad(x.minute,2,'0'))\"")