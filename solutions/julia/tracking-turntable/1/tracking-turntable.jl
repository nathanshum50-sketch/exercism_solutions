function z(x, y)
    return complex(x,y)
end

function euler(r, θ)
    return r*cis(θ)
end

function rotate(x, y, θ)
    complx = complex(x,y)*cis(θ)
    return (real(complx),imag(complx))
end

function rdisplace(x, y, r)
    complx = complex(x,y)
    given_r = abs(complx)
    complx = (r+given_r)/given_r*complx
    return (real(complx),imag(complx))
end

function findsong(x, y, r, θ)
    complx = complex(x,y)*cis(θ)
    given_r = abs(complx)
    complx = (r+given_r)/given_r*complx
    return (real(complx),imag(complx))
end
