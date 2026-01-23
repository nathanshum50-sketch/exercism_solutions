function choose(nucleotide)
    if nucleotide == 'A'
        return 'U'
    elseif nucleotide == 'C'
        return 'G'
    elseif nucleotide == 'G'
        return 'C'
    elseif nucleotide == 'T'
        return 'A'
    end
    throw(ErrorException("Unidentifiable nucleotide"))
end

function to_rna(dna)
    map(choose,dna)
end

