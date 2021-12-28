using Plots

plotly()
# Plots.PlotlyBackend()

plot(rand(5,5),linewidth=2,title="My Plot")
gr() # We will continue onward using the GR backend
plot(x,y,seriestype=:scatter,title="My Scatter Plot")
scatter(x,y,title="My Scatter Plot")

using Pkg
Pkg.add("Gadfly")
using Gadfly
draw(SVG("output.svg", 6inch, 3inch), plot([sin, cos], 0, 25))

using Pkg
Pkg.add("PyPlot")
using PyPlot
x = range(0,stop=2*pi,length=1000); y = sin.(3*x + 4*cos.(2*x))
plot(x, y, color="red", linewidth=2.0, linestyle="--")
