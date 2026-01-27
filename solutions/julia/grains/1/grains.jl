"""Calculate the number of grains on square `square`."""
function on_square(square)
    square >= 1 && square <= 64 ? UInt64(2)^(square-1) : throw(DomainError("No such square"))
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    square >= 1 && square <= 64 ? UInt64(2)^(square)-1 : throw(DomainError("No such square"))
end
