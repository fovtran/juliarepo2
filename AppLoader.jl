using Base.Threads
using Distributed
using BenchmarkTools

n_threads = Threads.nthreads()
println(n_threads)
i = Threads.Atomic{Int}(0);
ids = zeros(4);
old_is = zeros(4);
lk = SpinLock()
global b = false
global a = rand()
acc = Atomic{Int64}(0)

#  If there is I/O involved ReentrantLock should be used instead.
function f(a::Int64)
    l = Threads.SpinLock()
    acc = Atomic{Int64}(0)
    x = 0
    Threads.@threads for i in 1:10^7
        Threads.lock(l)
        # x += a  # this block is executed only in one thread
        atomic_add!(acc, a)
        Threads.unlock(l)
    end
    return x
end

function use(a::Int64)
    atomic_add!(acc, a)
end

function process()
    @threads for id in 1:4
        old_is[id] = atomic_add!(i, id)
        ids[id] = id
        begin
               lock(lk)
               try
                   use(1)
               finally
                   unlock(lk)
               end
           end
    end
end

function myprocess()
    print(acc[])
    process()
    print(acc[])
end

function randommatrix(a::Int64)
    # Futures
    r = @spawnat :any rand(a,a)
    s = @spawnat :any 1 .+ fetch(r)
    x = fetch(s)
    return x
end

function numpyload()
    include("E:/COMPILER_EXPLORER/NumpyAssist.jl")
end

function bench()
    # R = @benchmark data setup=(data=randmatrix())  print(R)
    C = @btime randommatrix()
end

# r = remotecall(randmatrix, 2, 4096, nothing)
#V = remotecall_fetch(sqrt, 4, r, nothing, nothing)
# print(fetch(r))

bench()
