function nr(a, prec)
    ctype = prec == 32 ? Float32 : Float64
    b = Complex{ctype}(a)
    c = (b + 1.0f0)::Complex{ctype}
    abs(c)
end

c = (b + 1.0f0)::Complex{T}

using LinearAlgebra

function mynorm(A)
    if isa(A, Vector)
        return sqrt(real(dot(A,A)))
    elseif isa(A, Matrix)
        return maximum(svdvals(A))
    else
        error("mynorm: invalid argument")
    end
end
This can be written more concisely and efficiently as:

norm(x::Vector) = sqrt(real(dot(x, x)))

function foo(a::Array{Any,1})
    x = a[1]::Int32
    b = x+1
end