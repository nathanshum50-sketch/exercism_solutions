triangle(a,b,c) = a > 0 && b > 0 && c > 0 && a+b >= c && a+c>=b && b+c >=a

function is_equilateral(sides)
    a = sides[1]
    b = sides[2]
    c = sides[3]
    return a > 0 && a == b && a == c
end

function is_isosceles(sides)
    a = sides[1]
    b = sides[2]
    c = sides[3]
    return triangle(a,b,c) && (a == b || b==c || a==c)
end

function is_scalene(sides)
    a = sides[1]
    b = sides[2]
    c = sides[3]
    return triangle(a,b,c) && !is_isosceles(sides)
end
