function proteins(strand)
    codons = []
    strength = length(strand)
    for s in 1:(strength ÷ 3 + (strength % 3 == 0 ? 0 : 1))
        start = s*3-2
        finish = s*3
        finish > strength && throw(DomainError("Not valid codon."))
        taken = strand[start:finish]
        prospect = translate(taken)
        prospect == "STOP" && return codons
        push!(codons,prospect)
    end
    return codons
end


function translate(codon)
    code = Dict("Methionine" => ["AUG"], "Phenylalanine" => ["UUU","UUC"], "Leucine" => ["UUA","UUG"], "Serine" => ["UCU","UCC","UCA","UCG"],"Tyrosine" => ["UAU","UAC"],"Cysteine"=>["UGU","UGC"],"Tryptophan"=>["UGG"],"STOP"=>["UAA","UAG","UGA"])
    for known in code
        for match in known.second
            if codon == match return known.first end
        end
    end
    throw(DomainError("Not valid codon."))
end