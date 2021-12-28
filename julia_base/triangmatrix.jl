function mymul!(C,A,B)
       (m,n) = size(C)
       mhalf = m>>1
       nhalf = n>>1
       mrange = (1:mhalf,1:mhalf,(mhalf+1):m,(mhalf+1):m)
       nrange = (1:nhalf,(nhalf+1):n,1:nhalf,(nhalf+1):n)
       Threads.@threads for i = 1:4
           mul!(view(C,mrange[i],nrange[i]),view(A,mrange[i],:),view(B,:,nrange[i]))
       end
       return C
end

julia> Alist=[randn(100,100) for i = 1:20];
julia> Blist=[randn(100,100) for i = 1:20];
julia> Clist=[zeros(100,100) for i = 1:20];
julia> function manymul!(Clist::Vector{<:Matrix},Alist::Vector{<:Matrix},Blist::Vector{<:Matrix})
       for i = 1:length(Clist)
           A_mul_B!(Clist[i],Alist[i],Blist[i])
       end
       return Clist
       end
julia> function manymul_threaded!(Clist::Vector{<:Matrix},Alist::Vector{<:Matrix},Blist::Vector{<:Matrix})
       Threads.@threads for i = 1:length(Clist)
           A_mul_B!(Clist[i],Alist[i],Blist[i])
       end
       return Clist
       end
julia> using BenchmarkTools
julia> @benchmark manymul!($Clist,$Alist,$Blist)

julia> using TriangularMatrices, BenchmarkTools, Compat, Compat.LinearAlgebra

julia> BLAS.set_num_threads(1);

julia> a24 = randmat(24); x24 = randmat(24); d24 = randmat(24);

julia> ma24 = Matrix(a24); mx24 = Matrix(x24); md24 = Matrix(d24);

julia> @benchmark TriangularMatrices.mul!($d24, $a24, $x24)
@benchmark mul!($md24, $ma24, $mx24)
