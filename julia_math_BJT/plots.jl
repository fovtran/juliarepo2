using Plots

gr()
data = rand(10)

plot(data, markershape = :ltriangle, color = [:orange :green :red])
