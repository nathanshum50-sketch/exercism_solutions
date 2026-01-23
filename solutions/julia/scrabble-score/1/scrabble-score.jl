function score(str)
    scores = Dict("AEIOULNRST" => 1, "DG" => 2, "BCMP" => 3, "FHVWY" => 4, "K" => 5, "JX" => 8, "QZ" => 10)
    increment = 0
    proceed = true
    str = str |> uppercase |> filter(isletter)
    ky = keys(scores)
    for s in str
        proceed = true
        for k in ky
            for letter in k
                if s == letter
                    increment += scores[k]
                    proceed = false
                    break
                end
            end
            if !proceed break end
        end
    end
    return increment
end
