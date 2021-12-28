using Pkg
Pkg.add("LinearAlgebra")
Pkg.add("SparseArrays")
Pkg.add("DataFrames")
Pkg.add("Plots")
Pkg.add(PackageSpec(url="https://github.com/VMLS-book/VMLS.jl"))
Pkg.add("JuMP")

macro history() InteractiveUtils.less(REPL.find_hist_file()); end

using LinearAlgebra, DataFrames, SparseArrays, VMLS
using Plots

A = [ 1 2 3 ; 4 5 6 ]
B = [ 7 8 ; 9 10 ; 11 12 ]

print( A*B )

x = [ 1.0, 0 ]; y = [ 1.0, -1.0 ]; z = [ 0, 1.0];
list = [ x, y, z ]

p_initial = [ 22.15, 89.32, 56.77 ];
p_final = [ 23.05, 87.32, 57.13 ];
r = (p_final - p_initial) ./ p_initial

# Scalar multiplication
a = [ 1, 2 ]; b = [ 3, 4 ];
alpha = -0.5; beta = 1.5;
c = alpha*a + beta*b

a = sparsevec( [ 123456, 123457 ], [ 1.0, -1.0 ], 10^6 )

# Linear function
a = [2 3 ; 4 5]; f([ 2 3 ; 5 6])

f(x) = x[1] + x[2] - x[4]^2

a = [-2, 0, 1, -3];
f(x) = a'*x # Inner product function
x = [2, 2, -1, 1]; y= [0, 1, -1, 0];
alpha = 1.5; beta = -3.7;
lhs = f(alpha * x + beta * y)
rhs = alpha * f(x) + beta * f(y)
# verification
e3 = [0, 0, 1, 0];
f(e3)

# averaging
avg(x) = (ones(length(x)) / length(x))'*x;
x = [1, -3, 2, -1];
avg(x)


temps = [ 71, 71, 68, 69, 68, 69, 68, 74, 77, 82, 85, 86,
88, 86, 85, 86, 84, 79, 77, 75, 73, 71, 70, 70, 69, 69, 69,
69, 67, 68, 68, 73, 76, 77, 82, 84, 84, 81, 80, 78, 79, 78,
73, 72, 70, 70, 68, 67 ];
plot(temps, marker = :circle, legend = false, grid = true)
