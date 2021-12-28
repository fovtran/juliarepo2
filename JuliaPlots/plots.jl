using Pkg
Pkg.add("Plots")
Pkg.add("PyPlot")
Pkg.add("pgfplotsx")

using Plots
## Lets jump right in
data = rand(10)
f = plot(data)
@show f

plot(data2, markershape = :ltriangle, linestyle = :dashdot, color = [:black :orange])