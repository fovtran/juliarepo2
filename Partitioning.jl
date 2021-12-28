using Base.Threads
using Distributed

a = rand(100000)  # Create array of random numbers
p = zeros(nthreads())  # Allocate a partial sum for each thread
# Threads macro splits the iterations of array `a` evenly among threads
@threads for x in a
   p[threadid()] += x  # Compute partial sums for each thread
end
s = sum(p)  # Compute the total sum
print(s)
