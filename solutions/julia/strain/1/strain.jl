function keep(values, predicate)
    return [v for v in values if predicate(v)]
end

function discard(values, predicate)
    return [v for v in values if !predicate(v)]
end
