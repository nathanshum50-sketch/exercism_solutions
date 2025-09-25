function random_planet()
    planets = ['D','H','J','K','L','M','N','R','T','Y']
    return rand(planets)
end

function random_ship_registry_number()
    number = rand(1000:9999)
    return "NNC-$number"
end

function random_stardate()
    return rand()*1000 + 41000
end

function random_stardate_v2()
    return rand(41000:0.1:42000)
end

function pick_starships(starships, number_needed)
    first(Random.shuffle(starships), number_needed)
end
