using LinearAlgebra, SparseArrays

N = 1000
A = sprand(N,N,1e-4)
@time F = qr(A)
@time F.Q
@time Q_sparse = sparse(F.Q)
