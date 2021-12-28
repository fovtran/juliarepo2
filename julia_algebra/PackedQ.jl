using LinearAlgebra, SparseArrays

N  = 500
ns = 3
d = 0.0001
A = sprand(N,N-ns,d)
H = A*A'

println("eigen")
@time eigen(Matrix(H))
println("qr")
@time F = qr(H)
println("Matrix(F.Q)")
@time Q = Matrix(F.Q)
println("sparse(Q)")
@time sparse(Q)
println("sparse(F.Q)")
@time sparse(F.Q)
