x = rand(5); for i in x::Vector{Float64}; println(i); end


global x = rand(1000)

function loop_over_global()
    s = 0.0
    for i in x::Vector{Float64}
        s += i
    end
    return s
end

julia> a = Real[]
0-element Array{Real,1}

julia> push!(a, 1); push!(a, 2.0); push!(a, ?)
3-element Array{Real,1}:
 1
 2.0
 ?

julia> a = Float64[]
0-element Array{Float64,1}

julia> push!(a, 1); push!(a, 2.0); push!(a,  ?)
3-element Array{Float64,1}:
 1.0
 2.0
 3.141592653589793


 mutable struct MyType{T<:AbstractFloat}
           a::T
       end

julia> m = MyType(3.2)
MyType{Float64}(3.2)

julia> typeof(m)
MyType{Float64}

julia> m = MyType{AbstractFloat}(3.2)
MyType{AbstractFloat}(3.2)

julia> typeof(m.a)
Float64

julia> m.a = 4.5f0
4.5f0

julia> typeof(m.a)
Float32