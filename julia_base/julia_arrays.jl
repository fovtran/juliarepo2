a = [1, 2, 3, 4, 5]
a1 = [1, 2, 3.0, 4, 5]
s = ["this", "is", "an", "array", "of", "strings"]
trigfuns = [sin, cos, tan]
array = Array{Int64}(undef, 5)
array3 = Array{Int64}(undef, 2, 2, 2)
[1, "2", 3.0, sin, pi]
typeof(ans)
Int64[1, 2, 3, 4]
b = Int64[]
b = String[]
b = Float64[]
[1 2 3 4]
[1 2 3 4 ; 5 6 7 8]
x = rand(5)
x = rand(5, 1)
Vector(undef, 5)
Matrix(undef, 5, 5)
for n in 1:10 print(n) end
collect(1:10)
collect(3.5:9.5)
collect(0:10:100)
collect(4:-1:1)
[1:6...]
range(1, length=12, stop=100)
range(1, stop=100, step=10)
collect(range(1, length=12, stop=100))
exp10.(range(2.0, stop=3.0, length=5))

step(range(1, length=10, stop=100))
range(1, step=3, length=20) |> collect
collect(0:5:100)

for i in collect(1:6)
println(i)
end

[n^2 for n in 1:5]
[r * c for r in 1:5, c in 1:5]
[i^2 for i=1:10  if i != 5]
collect(x^2 for x in 1:10)
collect(x^2 for x in 1:10 if x != 1)
zeros(2, 3)
zeros(Int64, 3, 5)
ones(2, 3)
rand(2, 3)
rand(1:6, 3, 3)
trues(3, 4)
fill(42, 9)
fill("hi", 2, 2)
a = zeros(10)
fill!(a, 42)
trueArray = falses(3,3)
fill!(trueArray, true)
a = reshape(range(0, stop=100, length=30), 10, 3)
repeat([1, 2, 3], 2)
repeat([1, 2, 3], 2, 3)
repeat([1, 2], inner = [2, 3])
repeat([1, 2], outer = [2, 3])
repeat([1 2; 3 4], inner=(2, 1), outer=(1, 3))
Array{Int64}(undef, 6)
a = Array[[1, 2], [3,4]]
Array[1:3, 4:6]
reshape([1, 2, 3, 4, 5, 6, 7, 8], 2, 4)
Array{String}(undef, 2, 3, 4)
[:, :, 2] =
push!(a, rand(1:100, 5))
push!(a, rand(1:100, 5))
a = Vector{Int}[[1, 2], [3, 4]]
push!(a,  rand(1:100, 5))
a = collect(1:10)
b = similar(a)
a = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
a[5]
a[end]
a[end-1]
a[[3,6,2]]
f(a, b) = a * b
a = rand(0:10,10, 10)
table = [r * c for r in 1:5, c in 1:5]
table[1, :]
smallprimes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29];
findfirst(isequal(13), smallprimes)
smallprimes[6]
findfirst(x -> x == 13, smallprimes)
intersect(5:20, 1:15, 3:12)
setdiff(5:20, 1:15)
filter(isodd, 1:10)
count(isodd, 1:100)
any(isodd, 1:100)
extrema(a)
sum(a)
prod(1:10)
mean(a)
middle(a)

using Combinatorics
collect(combinations(a, 3))
length(permutations(a))
pushfirst!(a, 0)
splice!(a, 4:5, 4:6)
L = ['a','b','f']
splice!(L, 3:2, ['c','d','e'])
deleteat!(a, findfirst(isequal(6), a))
rotr90([1 2 3 ; 4 5 6])
circshift(1:6, 1)
table = collect(r*c for r in 1:5, c in 1:5)
circshift(table, (0, 1))
setindex!(a, 1:10, 10:-1:1)
A = reshape(1:12, 3, 4)
B = ones(3,4)
A + B
A - B
A = [1 2 ; 3 4]
B = [10 11 ; 12 13]
A .* B
A * B
A = rand(1:9, 3, 3)
B = rand(1:9, 3, 3)
A \ B
A / B
A // 2
A ./ 2
A .< 6
A = reshape(1:12, 3, 4)
V = collect(1:4)
A * V
using LinearAlgebra
dot([1:3...], [21:23...])
A = reshape(1:12, 3, 4)
B = reshape(100:100:1200, 3, 4)
hcat(A, B)
vcat(A, B)
vec(ones(3, 4))
transpose(M)
M' 
A = rand(2:10, 3, 3)
det(A)
inv(A)
rank(A)
nullspace(A)

using Statistics; mean(A)
A = rand(-1:2:1, 3, 3)
B = rand(-2:4:2, 3, 3)
A = reshape(collect(BigInt(1):25), 5, 5)
prod(A)

X = [2, 4, -5]
LinearAlgebra.norm(X)
LinearAlgebra.norm(x, 1) # 1-norm of the vector, the sum of element magnitudes
LinearAlgebra.norm([1 2 3] - [2 4 6])
LinearAlgebra.norm([1, 2, 3] - [2, 4, 6])
 B = [5 -4 2 ; -1 2 3; -2 1 0]
 LinearAlgebra.norm(B, 1)
 LinearAlgebra.norm(B, Inf)
 LinearAlgebra.norm([2 3 ; 4 6]), sqrt(2^2 + 3^2 + 4^2 + 6^2)
 
A = [1 2 3 4 5 6 7 8 9] 
rmul!(A, 2)
rot180(A)
circshift(A, (1, 1))
reverse(A, dims=(1))
reverse(A, dims=(2))
b = squeeze(a, dims=(1))
using Random
rp = randperm(10)
sort(rp)
a = reshape(rand(1:20, 20), 4, 5)
 sort(a, dims=(2)) # sort each row, dimension 2
  r = rand(100:110, 10)
  sortperm(r)
  r[sortperm(r)] 
  
  r = ["1E10", "150", "25", "3", "1.5", "1E-10", "0.5", ".999"];
sort(r)
sort(r, by = x -> Meta.parse(x))
table = collect(enumerate(rand(1:100, 10)))
sort(table, by = x -> x[2])
a = [[2, 2, 2, 1],
             [1, 1, 1, 8],
             [2, 1, 2, 2],
             [1, 2, 2, 5],
             [2, 1, 1, 4],
             [1, 1, 2, 7],
             [1, 2, 1, 6],
             [2, 2, 1, 3]] ;
sort(a, by = col -> (col[1], col[2], col[3]))

vowelcount(string) = count(c -> (c in "aeiou"), lowercase(string))
sentence = split("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
sort(sentence, lt = (x,y) -> vowelcount(x) > vowelcount(y))

table = ["F" "B" "I"; "A" "D" "G"; "H" "C" "E"]
sortslices(table, dims=1)
sortslices(table, dims=2)
sortslices(table, dims=1, by = x -> x[2])
t = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
t[6:end]

 shape1 = (corner1 = (1, 1), corner2 = (-1, -1), center = (0, 0))
 shape2 = NamedTuple{ks}(vs)
 colors = (top = "red", bottom = "green")
 merge(shape2, colors)
 typeof(shape3)
 shape3 = merge(shape2, colors)
 
 
(1+2)::AbstractFloat
(1.0+2.0)::AbstractFloat
(1+2)::Int
function foo()
  x::Int8 = 100
  x
end
foo()
typeof(ans)
	   
function sinc(x)::Float64
    if x == 0
        return 1
    end
    return sin(pi*x)/(pi*x)
end

abstract type «name» end
abstract type «name» <: «supertype» end

abstract type Number end
abstract type Real     <: Number end
abstract type AbstractFloat <: Real end
abstract type Integer  <: Real end
abstract type Signed   <: Integer end
abstract type Unsigned <: Integer end

 Integer <: Number
 Integer <: AbstractFloat
 
function myplus(x::Int,y::Int)
    x+y
end

primitive type Float16 <: AbstractFloat 16 end
primitive type Float32 <: AbstractFloat 32 end
primitive type Float64 <: AbstractFloat 64 end

primitive type Bool <: Integer 8 end
primitive type Char <: AbstractChar 32 end

primitive type Int8    <: Signed   8 end
primitive type UInt8   <: Unsigned 8 end
primitive type Int16   <: Signed   16 end
primitive type UInt16  <: Unsigned 16 end
primitive type Int32   <: Signed   32 end
primitive type UInt32  <: Unsigned 32 end
primitive type Int64   <: Signed   64 end
primitive type UInt64  <: Unsigned 64 end
primitive type Int128  <: Signed   128 end
primitive type UInt128 <: Unsigned 128 end

primitive type «name» «bits» end
primitive type «name» <: «supertype» «bits» end

struct Foo
   bar
   baz::Int
   qux::Float64
end

foo = Foo("Hello, world.", 23, 1.5)
typeof(foo)
fieldnames(Foo)

mutable struct Bar
   baz
   qux::Float64
end

bar = Bar("Hello", 1.5);
bar.qux = 2.0
bar.baz = 1//2

typeof(Real)
typeof(Int)

IntOrString = Union{Int,AbstractString}
1 :: IntOrString
"Hello!" :: IntOrString
1.0 :: IntOrString

struct Point{T}
   x::T
   y::T
end

Point{Float64}
Point{AbstractString}
Point{Float64} <: Point
Point{AbstractString} <: Point
AbstractString <: Point
Point{Float64} <: Point{Int64}
Point{Float64} <: Point{Real}

function norm(p::Point{Real})
    sqrt(p.x^2 + p.y^2)
end
function norm(p::Point{<:Real})
    sqrt(p.x^2 + p.y^2)
end

Point{Float64}(1.0, 2.0)
typeof(ans)


abstract type Pointy{T} end
Pointy{Int64} <: Pointy
Pointy{1} <: Pointy
Pointy{Float64} <: Pointy{Real}
Pointy{Real} <: Pointy{Float64}

struct Point{T} <: Pointy{T}
   x::T
   y::T
end

Point{Float64} <: Pointy{Float64}
Point{Real} <: Pointy{Real}
Point{AbstractString} <: Pointy{AbstractString}

struct DiagPoint{T} <: Pointy{T}
   x::T
end

abstract type Pointy{T<:Real} end
Pointy{Float64}
Pointy{Real}
struct Point{T<:Real} <: Pointy{T}
    x::T
    y::T
end

struct Rational{T<:Integer} <: Real
    num::T
    den::T
end

struct Tuple2{A,B}
    a::A
    b::B
end

Tuple{Int,AbstractString} <: Tuple{Real,Any}
Tuple{Int,AbstractString} <: Tuple{Real,Real}
Tuple{Int,AbstractString} <: Tuple{Real,}

mytupletype = Tuple{AbstractString,Vararg{Int}}
isa(("1",), mytupletype)
isa(("1",1), mytupletype)
isa(("1",1,2), mytupletype)
 isa(("1",1,2,3.0), mytupletype)
 
 typeof((a=1,b="hello"))
 NamedTuple{(:a, :b),Tuple{Float32, String}}((1,""))
 NamedTuple{(:a, :b)}((1,""))
 
isa(Float64, Type{Float64})
isa(Real, Type{Float64})
isa(Real, Type{Real})
isa(Float64, Type{Real})

isa(Type{Float64}, Type)
isa(Float64, Type)
isa(Real, Type)
isa(1, Type)
isa("foo", Type)

# 32-bit system:
primitive type Ptr{T} 32 end

# 64-bit system:
primitive type Ptr{T} 64 end

Ptr{Float64} <: Ptr
Ptr{Int64} <: Ptr

const T1 = Array{Array{T,1} where T, 1}
const T2 = Array{Array{T,1}, 1} where T

Vector{T} = Array{T,1}

# 32-bit system:
UInt

# 64-bit system:
UInt

if Int === Int64
    const UInt = UInt64
else
    const UInt = UInt32
end

isa(1, Int)
true

isa(1, AbstractFloat)
typeof(Rational{Int})
typeof(Union{Real,String})
typeof(DataType)
typeof(Union)

supertype(Float64)
supertype(Number)
supertype(AbstractString)
supertype(Any)


struct Polar{T<:Real} <: Number
   r::T
   Θ::T
end

Polar(r::Real,Θ::Real) = Polar(promote(r,Θ)...)
Base.show(io::IO, z::Polar) = print(io, z.r, " * exp(", z.Θ, "im)")
Base.show(io::IO, ::MIME"text/plain", z::Polar{T}) where{T} =
           print(io, "Polar{$T} complex number:\n   ", z)
		   
Polar(3, 4.0)
[Polar(3, 4.0), Polar(4.0,5.3)]
Base.show(io::IO, ::MIME"text/html", z::Polar{T}) where {T} =
           println(io, "<code>Polar{$T}</code> complex number: ",
                   z.r, " <i>e</i><sup>", z.Θ, " <i>i</i></sup>")
				   
show(stdout, "text/html", Polar(3.0,4.0))

a = Polar(3, 4.0)
 print(:($a^2))
 
 function Base.show_unquoted(io::IO, z::Polar, ::Int, precedence::Int)
   if Base.operator_precedence(:*) <= precedence
	   print(io, "(")
	   show(io, z)
	   print(io, ")")
   else
	   show(io, z)
   end
end

:($a^2)
:($a + 2)
:($a == 2)

 function Base.show(io::IO, z::Polar)
   if get(io, :compact, false)
	   print(io, z.r, "ℯ", z.Θ, "im")
   else
	   print(io, z.r, " * exp(", z.Θ, "im)")
   end
end

show(IOContext(stdout, :compact=>true), Polar(3, 4.0))
[Polar(3, 4.0) Polar(4.0,5.3)]

struct Val{x} end
Val(x) = Val{x}()

firstlast(::Val{true}) = "First"
firstlast(::Val{false}) = "Last"
firstlast(Val(true))
firstlast(Val(false))

T = Float64
foo(x) = x;
function foo{T}(x::T, y::S) where S = x+y end

struct A{T} end
A{T}(::T) where T = A{T}()
A{Float64}(2) # error
A{Float64}(2.0) #Ok