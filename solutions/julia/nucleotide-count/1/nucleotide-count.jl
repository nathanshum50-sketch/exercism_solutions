"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    for st in strand
        if st != 'A' && st != 'G' && st != 'C' && st != 'T'
            throw(DomainError(st, "'A'/'G'/'C'/'T' expected"))
        end
    end
    A = count('A', strand)
    G = count('G', strand)
    C = count('C', strand)
    T = count('T', strand)
    counter = Dict('A'=>A, 'G'=>G, 'C'=>C, 'T'=>T)
    return counter
end
