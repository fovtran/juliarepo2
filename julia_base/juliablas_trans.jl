import Pkg; Pkg.add("RecursiveArrayTools");

using LinearAlgebra;

A = [[1,2,3], [4,5,6]];
A = [ 1 2 3 ; 4 5 6]
A = Array{Float64,2}( undef, (5,5) );
A = AbstractArray{Float64,1} =>[[1,2,3], [4,5,6]];

B = [[7,8],[9,10],[11,12]]
B = [ 7 8 ; 9 10 ; 11 12 ]

C = Array{Float64,1} => [0 0;0 0]
C = Vector{Float64}([0,0,0,0])
C = [ 0 0 ; 0 0 ]

BLAS.gemm!('N', 'T', 1.0, A, B, 0.0, C)
D = BLAS.gemm('N', 'T', 1.0, A, B)

C == D
