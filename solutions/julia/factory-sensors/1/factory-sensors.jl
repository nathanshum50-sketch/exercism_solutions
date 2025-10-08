function humiditycheck(pct_humidity)
    if pct_humidity <= 70
        @info "humidity level check passed: $pct_humidity%"
    else
        error("Humidity check !!FAILED!!: $pct_humidity%")
    end
end

function temperaturecheck(temperature)
    if isnothing(temperature)
        throw(ArgumentError("Temperature sensor broken"))
    elseif temperature > 500
        throw(DomainError(temperature))
    else
        @info "temperature check passed: $temperature °C"
    end
end

# define MachineError here
struct MachineError <: Exception
    problems::String    
end

function machinemonitor(pct_humidity, temperature)
    problem = false
    problems = []
    try
        humiditycheck(pct_humidity)
    catch problem
        if problem isa ErrorException
            @error "humidity level check failed: $pct_humidity%"
            problem = true
            push!(problems,"humidity check")
        else
            rethrow()
        end
    end
    try
        temperaturecheck(temperature)
    catch problem
        if problem isa ArgumentError
            @warn "sensor is broken"
            problem = true
            push!(problems,"temperature sensor")
        elseif problem isa DomainError
            @error "overheating detected: $temperature °C"
            problem = true
            push!(problems,"temperature check")
        else
            rethrow()
        end
    end
    problem && throw(MachineError(join(problems, "; ")))
end
