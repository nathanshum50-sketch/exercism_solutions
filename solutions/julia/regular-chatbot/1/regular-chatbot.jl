
function is_valid_command(msg)
    r"^chatbot"i |> occursin(msg)
end

function remove_emoji(msg)
    replace(msg,r"emoji(\d+)" => "")
end

function check_phone_number(number)
    if occursin(r"\(\+(\d{2})\) (\d{3})\-(\d{3})\-(\d{3})",number)
        "Thanks! You can now download me to your phone."
    else
        "Oops, it seems like I can't reach out to $number"
    end
end

function getURL(msg)
    matches = eachmatch(r"(\w+)\.(\w+)",msg)
    [join(match,".") for match in matches]
end

function nice_to_meet_you(str)
    list = match(r"(?<last>\w+), (?<first>\w+)",str)
    new = [list[2],list[1]]
    given = [titlecase(known) for known in new]
    name = join(given, " ")
    "Nice to meet you, $name"
end
