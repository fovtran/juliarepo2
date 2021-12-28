include("./types.jl")
include("./a_function.jl")
using .TypeModule, .AFunctionModule
using BenchmarkTools

my_a = A()
takes_a(my_a)
