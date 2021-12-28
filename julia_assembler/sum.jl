function my_a(x::Float64)
  x+=1
end

# my_a (generic function with 1 method)

@code_native (my_a(0))

-----------------------

ENV["PYTHON"]="d:/binr/python35/python.exe"
Pkg.build("PyCall")
Pkg.add("Plots")
Pkg.add("Measures")
Pkg.add("PyPlot")
Pkg.add("NPZ")
Pkg.add("FileWatching")
Pkg.add("MPI")
Pkg.add("ZMQ")

-----------------------
import ZMQ
import MPI

-----------------------
import NPZ
a = rand(20)
NPZ.npzwrite("d:/test.npz", a)

using PyCall

py"""
  import numpy
  xs = numpy.ones((2, 3))
  """

xs = PyArray(py"xs"o)

-----------------------
using PyCall
math = pyimport("math")
math.sin(math.pi / 4)

plt = pyimport("matplotlib.pyplot")
x = range(0;stop=2*pi,length=1000); y = sin.(3*x + 4*cos.(2*x));
plt.plot(x, y, color="red", linewidth=2.0, linestyle="--")
plt.show()

so = pyimport("scipy.optimize")
so.newton(x -> cos(x) - x, 1)

@pywith pybuiltin("open")("file.txt","w") as f begin
    f.write("hello")
end

-----------------------

__precompile__()
module MyModule

using PyCall

function __init__()
    py"""
    import numpy as np

    def one(x):
        return np.sin(x) ** 2 + np.cos(x) ** 2
    """
end

two(x) = py"one"(x) + py"one"(x)

end

-----------------------
P = pyimport("numpy.polynomial")
@pydef mutable struct Doubler <: P.Polynomial
    function __init__(self, x=10)
        self.x = x
    end
    my_method(self, arg1::Number) = arg1 + 20
    x2.get(self) = self.x * 2
    function x2.set!(self, new_val)
        self.x = new_val / 2
    end
end
Doubler().x2

-----------
import numpy.polynomial
class Doubler(numpy.polynomial.Polynomial):
    def __init__(self, x=10):
        self.x = x
    def my_method(self, arg1): return arg1 + 20
    @property
    def x2(self): return self.x * 2
    @x2.setter
    def x2(self, new_val):
        self.x = new_val / 2
Doubler().x2
-----------

-----------------------

import numpy as np
import matplotlib.pyplot as plt

rot = np.array([[0.90, -0.30], [0.30, 0.90]])
sca = np.array([[3.4, 0], [0, 2]])

np.random.seed(150)
cd = (np.random.randn(100,2)).dot(sca).dot(rot)
plt.plot(cd)
plt.show()

-----------------------
import numpy as np
b = np.load("d:/test.npz")


-----------------------
