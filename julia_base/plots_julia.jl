
using Pkg
Pkg.clone("https://github.com/cormullion/Astro.jl")
Pkg.add("Astro")
Pkg.add("GR")
Pkg.add("Plots")
using Dates
using Astro
using Plots
days = Dates.datetime2julian.(Dates.DateTime(2018, 1, 1, 0, 0, 0):Dates.Day(1):Dates.DateTime(2018, 12, 31, 0, 0, 0))
eq_values = map(equation_time, days)
gr();
plot(eq_values)
plot!(equation, 1:365)
(xticks = (1:14:366, datestrings[1:14:366])
plot!(                                    
    eq_values,                                        
                                                      
    label  = "equation of time (calculated)",     
    line=(:black, 0.5, 6, :solid),                
                                                  
    size=(800, 600),                              
                                                  
    xticks = (1:14:366, datestrings[1:14:366]),   
    yticks = -20:2.5:20,                          
                                                  
    ylabel = "Minutes faster or slower than GMT", 
    xlabel = "day in year",                       
                                                  
    title  = "The Equation of Time",              
    xrotation = rad2deg(pi/3),                    
                                                  
    fillrange = 0,                                
    fillalpha = 0.25,                             
    fillcolor = :lightgoldenrod,                  
                                                  
    background_color = :ivory                     
    )
	