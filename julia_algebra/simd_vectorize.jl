const m128 = NTuple{4,VecElement{Float32}}

function add(a::m128, b::m128)
    (VecElement(a[1].value+b[1].value),
     VecElement(a[2].value+b[2].value),
     VecElement(a[3].value+b[3].value),
     VecElement(a[4].value+b[4].value))
end

triple(c::m128) = add(add(c,c),c)

code_native(triple,(m128,))

---------------------------

x = 0.0;
@simd for n = 1:10
  global x
  x += 1;
  x *= 2;
end

---------------------------

@noinline function g(a,b)
              @simd for i=1:length(a)
               @inbounds a[i] += b[i]
              end
              nothing
              end
N=16;a0=ones(Int,N); a=view(a0, 2:N); b=view(a0,1:N-1); g(a,b); a0

----------------------------

@noinline function g_unroll(a,b)
              for i=1:(length(a)>>1)
              a1 = a[2*i-1]
              a2 = a[2*i]
              b1 = b[2*i-1]
              b2 = b[2*i]
              a[2*i-1] = a1+b1
              a[2*i] = a2+b2
              end
              nothing
              end


-----------------------------

@noinline function g(a,b)
              @simd ivdep for i=1:length(a)
               @inbounds a[i] += b[i]
              end
              nothing
              end


-----------------------------

function mysum(v::Vector{Float64})
    t = 0.0
    for x in v
        t += x
    end
    return t
end

function mysum_simd(v::Vector{Float64})
    t = 0.0
    @simd for x in v
        t += x
    end
    return t
end

v = rand(10^6);

mysum(v)
# 499897.00784308364

mysum_simd(v)
# 499897.00784311077

-----------------------------

function sumsto(x::Float64)
    0 <= x < exp2(970) || throw(ArgumentError("sum must be in [0,2^970)"))
    n, p₀ = Base.decompose(x) # integers such that `n*exp2(p₀) == x`
    [floatmax(); [exp2(p) for p in reverse(-1074:969) if iseven(n >> (p-p₀))]
    -floatmax(); [exp2(p) for p in reverse(-1074:969) if isodd(n >> (p-p₀))]]
end

s = rand()*10^6

v = sumsto(s)

mysum(v)
mysum_simd(v)
abs(mysum_simd(v)-mysum(v))/mysum(v)
sum(v)

----------------------------

rng = Random.MersenneTwister(1234);
x1 = rand(rng, 2000)
rng = Random.MersenneTwister(1234);
x2 = rand(rng, 2000)
x1==x2

----------------------------

let seed::UInt32 = 123;ccall((:srand, "libc.so.6"), Cvoid, (Ptr{Cuint},), Ref(seed)) end

ccall((:rand, "libc.so.6"), Cint, (), )

-----------------------------

function sumsto(x::Float64)
    0 <= x < exp2(970) || throw(ArgumentError("sum must be in [0,2^970)"))
    n, p₀ = Base.decompose(x) # integers such that `n*exp2(p₀) == x`
    [floatmax(); [exp2(p) for p in reverse(-1074:969) if iseven(n >> (p-p₀))]
    -floatmax(); [exp2(p) for p in reverse(-1074:969) if isodd(n >> (p-p₀))]]
end

rng = Random.MersenneTwister(1234);
s = rand(rng)*10^6

v = sumsto(s)

mysum(v)
mysum_simd(v)
abs(mysum_simd(v)-mysum(v))/mysum(v)
sum(v)

rng = Random.MersenneTwister(1234);@code_native debuginfo=:none mysum(rand(rng, 10^6))
rng = Random.MersenneTwister(1234);@code_native debuginfo=:none mysum_simd(rand(rng, 10^6))

----------------------------

1 + eps()/2 - 1
# 0.0
eps()/2 + (1 - 1)
# 1.1102230246251565e-16

----------------------------


* You are asserting it is safe to execute iterations in arbitrary or overlapping order, with special consideration for reduction variables.
* Floating-point operations on reduction variables must be reordered, possibly causing different results than without @simd.
* The object iterated over should be a one-dimensional range.
* The loop must be an innermost loop
* The loop body must be straight-line code.
* Accesses must have a stride pattern and cannot be gathers (random-index reads) or "scatters" (random-index writes).
* The stride should be unit stride.
* There exists no loop-carried memory dependencies
* No iteration ever waits on a previous iteration to make forward progress.
