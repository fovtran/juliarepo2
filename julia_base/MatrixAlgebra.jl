using Pkg
Pkg.add("Plots")
Pkg.add("LinearAlgebra")
Pkg.add("SparseArrays")
Pkg.add("DataFrames")
Pkg.add(PackageSpec(url="https://github.com/VMLS-book/VMLS.jl"))

using LinearAlgebra, SparseArrays, VMLS


A = [ 1 2 3 ; 4 5 6 ]
B = [ 6 7 ; 8 9 ; 10 11 ]
A*B
# A=2x3 B=2x2  x=alto y=dims

x = [ 1.0, 0 ]; y = [ 1.0, -1.0 ]; z = [ 0, 1.0];
list = [ x, y, z ]

p_initial = [ 22.15, 89.32, 56.77 ]
p_final = [ 23.05, 87.32, 57.13 ]
r = (p_final - p_initial) ./ p_initial
