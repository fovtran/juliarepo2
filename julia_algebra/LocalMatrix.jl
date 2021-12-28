"""
    struct LocalMatrix{T} <: AbstractMatrix{T}
Block diagonal structure for local matrix. `A[:,:,s,iK]` is a block matrix for
state s and element iK
"""
struct LocalMatrix{T} <: AbstractMatrix{T}
    data::Array{T,4}

    function LocalMatrix{T}(data) where {T}
        new{T}(data)
    end
end
[... implement size, getindex, setindex! ... all working perfectly]

"""
    issymmetric(A::LocalMatrix)
Tests whether a LocalMatrix is symmetric
"""
function issymmetric(A::LocalMatrix)
    println("my issymmetric")
    all(LinearAlgebra.issymmetric, [@view A.data[:,:,i,j] for i=1:size(A.data,3), j=1:size(A.data,4)])
end

"""
    isdiag(A::LocalMatrix)
Tests whether a LocalMatrix is diagonal
"""
function isdiag(A::LocalMatrix)
    println("my isdiag")
    all(LinearAlgebra.isdiag, [@view A.data[:,:,i,j] for i=1:size(A.data,3), j=1:size(A.data,4)])
end
