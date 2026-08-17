const species = ["fly","spider","bird","cat","dog","goat","cow","horse"]
const comments = [
    "I don't know why she swallowed the fly. Perhaps she'll die.",
    "It wriggled and jiggled and tickled inside her.",
    "How absurd to swallow a bird!",
    "Imagine that, to swallow a cat!",
    "What a hog, to swallow a dog!",
    "Just opened her throat and swallowed a goat!",
    "I don't know how she swallowed a cow!",
    "She's dead, of course!"
]

function recite(start_verse, end_verse)
    if end_verse > 8 || start_verse < 1 || start_verse > end_verse throw(ArgumentError("Invalid song index")) end
    verses = []
    medium = min(end_verse,7)
    for i in start_verse:1:medium
        push!(verses,familiar(species[i]))
        push!(verses,comments[i])
        for j in i:-1:1
            if j > 1
                subject = species[j]
                object = species[j-1]
                push!(verses,imperative(subject,object))
            elseif i != j
                push!(verses,comments[1])
            end
        end
        if i < end_verse push!(verses,"") end
    end
    if end_verse > 7
        push!(verses,familiar(species[8]))
        push!(verses,comments[8])
    end
    return verses
end

function familiar(subject)
    return "I know an old lady who swallowed a $subject."
end

function imperative(subject,object)
    if object == "spider"
        addenum = comments[2][3:end]
        return "She swallowed the $subject to catch the spider that" * addenum
    end
    return "She swallowed the $subject to catch the $object."
end