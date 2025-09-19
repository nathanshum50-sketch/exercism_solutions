triangle(a,b,c) = a > 0 && a+b >= c

function is_equilateral(sides)
    a,b,c = sort(sides)
    return a > 0 && length(unique(sides)) == 1
end

function is_isosceles(sides)
    a,b,c = sort(sides)
    return triangle(a,b,c) && length(unique(sides)) <= 2
end

function is_scalene(sides)
    a,b,c = sort(sides)
    return triangle(a,b,c) && length(unique(sides)) == 3
end
