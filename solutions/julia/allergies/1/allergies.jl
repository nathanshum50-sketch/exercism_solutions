function allergic_to(score, allergen)
    list = Dict("eggs"=>1,"peanuts"=>2,"shellfish"=>3,"strawberries"=>4,"tomatoes"=>5,"chocolate"=>6,"pollen"=>7,"cats"=>8)
    if haskey(list,allergen)
        last = list[allergen]
    else
        return false
    end
    while last > 1
        score = score ÷ 2
        last -= 1
    end
    return score%2 == 1
end

function allergy_list(score)
    list = ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]
    output = Set()
    basic = 1
    while score > 0 && basic < 9
        score % 2 == 1 && push!(output,list[basic])
        score = score ÷ 2
        basic += 1
    end
    return output
end
