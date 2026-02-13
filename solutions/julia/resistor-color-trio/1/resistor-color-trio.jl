const CODE = Dict(
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
)

const UNIT = (
    "gigaohm" => 1000000000,
    "megaohm" => 1000000,
    "kiloohm" => 1000,
    "ohm" => 1
)

function label(colors)
    raw = getindex.(Ref(CODE),colors[1:2]) .* [exp10(CODE[colors[3]]+1),exp10(CODE[colors[3]])] |> sum
    return unit_form(raw)
end

function unit_form(value)
    for kv in UNIT
        if value >= kv.second
            coached = value/kv.second
            united = kv.first
            if coached == 1 return "1 $united" end
            if coached % 1 == 0 return "$(Int(coached)) $(united)s" end
            return "$coached $(united)s"
        end
    end
    if value % 1 == 0 return "$(Int(value)) ohms" end
    return "$value ohms"
end
