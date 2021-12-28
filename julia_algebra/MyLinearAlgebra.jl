module MyLinearAlgebra

import LinearAlgebra
import Base: getindex, setindex!, size

export
# Types
LocalMatrix,
SolutionVector,
# Functions
issymmetric,
isdiag
# Operators
# Constants

include("SolutionVector.jl")
include("LocalMatrix.jl")

end
