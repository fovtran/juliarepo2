using SIMDArrays, StaticArrays, BenchmarkTools, LinearAlgebra
function copyloop!(x, y) # Broadcasts slow to compile at the moment; will fix when I implement broadcasting!
    @boundscheck size(x) == size(y) || throw(BoundsError())
    @inbounds for i ∈ eachindex(x,y)
        x[i] = y[i]
    end
end
function Base.convert(::Type{MMatrix}, A::SIMDArrays.SizedSIMDMatrix{M,N,T}) where {M,N,T}
    out = MMatrix{M,N,T}(undef)
    copyloop!(out, A)
    out
end
function create_constants(M,N,P)
    dsym, asym, xsym = Symbol(:D_, M,:_,P), Symbol(:A_, M,:_,N), Symbol(:X_, N,:_,P)
    @eval const $dsym, $asym, $xsym = SIMDArrays.randsimd($M,$P), SIMDArrays.randsimd($M,$N), SIMDArrays.randsimd($N,$P)
    @eval const $(Symbol(:m,dsym)), $(Symbol(:m,asym)), $(Symbol(:m,xsym)) = convert(MMatrix, $dsym), convert(MMatrix, $asym), convert(MMatrix, $xsym)
    nothing
end
