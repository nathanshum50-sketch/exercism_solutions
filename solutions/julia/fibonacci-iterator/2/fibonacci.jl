# Defined a custom type Fib
struct Fiberator
    n::Int
end

# Implemented `iterate` method(s)
function Base.iterate(F::Fiberator, standard=(1,1,0))
    first, second, index = standard
    next = first + second
    if index < F.n
        return (first, (second, next, index+1))
    end
    return
end

# Made `collect` work
Base.length(F::Fiberator) = F.n

# Enabled Julia to infer element type
Base.eltype(::Type{Fiberator}) = Int