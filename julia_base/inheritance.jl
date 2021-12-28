julia> using StructuralInheritance

julia> @protostruct mutable struct Foo{T}
           someField::T
           someOtherField::T
           Foo(x::T) where T = new{T}(x,x^2)
           Foo(x::T,y::T) where T = new{T}(x,y)
       end
ProtoFoo

julia> @protostruct mutable struct Bar <: Foo{Int}
                  yetAnotherField::Float32
              end
ProtoBar
julia> Bar(x) = Bar(StructuralInheritance.totuple(Foo(x))...,x^3) #even superconstructors
Bar

julia> Bar(2)
Bar(2, 4, 8.0f0)

julia> @doc Bar
  No documentation found.