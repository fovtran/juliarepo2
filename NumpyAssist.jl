include("./NumpyUnPickle.jl")
using .NumpyUnPickle

filename="E:/COMPILER_EXPLORER/TOOLING2/REWORK_NUMPY/my-pickle.npz"
data = NumpyUnPickle.loadz(filename)
A = data["A"]
C = data["C"]
U = data["U"]
V = data["V"]
print(V)
