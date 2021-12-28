include("./types.jl")
using .TypeModule

module AFunctionModule
function takes_a(a::Main.TypeModule.A)
    println("Took A!")
    return a
end
export takes_a
end
