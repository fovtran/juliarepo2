using Distributed
addprocs(4)
using Base.Threads
using SharedArrays

function test1()
    len=10000000
    a = zeros(len)
    @inbounds for i in 1:len
        a[i] = rand()^3 #here goes my function
    end
    return a
end

function test2()
    len=10000000
    a = zeros(len)
    @inbounds @threads for i in 1:len
        a[i] = rand()^3 #here goes my function
    end
    return a
end

function test3()
    len=10000000
    a = SharedArray(zeros(len))
    @inbounds @distributed for i in 1:len
        a[i] = rand()^3 #here goes my function
    end
    return a
end
