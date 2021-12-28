using LinearAlgebra
using Distributions
using BenchmarkTools

function solve_b!(A, tol_iters)
    b   = [1.0 2.0]'
    luA = lu!(A)
    x   = [0.0; 0.0]
    for i =1:tol_iters
        A[1,1] += 0.001
        A[2,2] += 0.001
        luA = lu!(A)
        ldiv!(x, luA, b)
    end
end

A = rand(2,2)
solve_b!(A, 1000)

# If I run this with julia --track-allocation=user,
# I see that most of the memory allocation comes from
# b   = [1.0 2.0]' and
# x   = [0.0; 0.0].
# That is, when I see the .mem file,
# I see the following:

#   96     b   = [1.0 2.0]'
#    0     luA = lu!(A)
#   96     x   = [0.0; 0.0]
