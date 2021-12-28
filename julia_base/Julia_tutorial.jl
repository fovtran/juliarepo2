using Pkg
Pkg.add("SymPy")
Pkg.add("IJulia")
Pkg.add("Plots")

using IJulia
notebook(dir="C:\\users\\LogicAudio\\Desktop\\Haskell")

using SymPy
using Plots; 
ex = x^2 - 2x + 4
plot(ex, -1, 3)          # plot of a symbolic expression