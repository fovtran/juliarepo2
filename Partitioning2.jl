using Base.Threads: @spawn
n_threads = Threads.nthreads()

function task()
    x = rand(0.001:0.001:0.05)  # Generate a variable workload
    sleep(x)  # Sleep simulates the workload
    return x  # Return the workload
end

n = 1000  # Number of tasks
p = zeros(n)  # Total workload per thread
@sync for threadid in 1:n
   @spawn p[threadid] += task()  # Spawn tasks and sum the workload
end

s = sum(p)  # Total workload
println(round.(p/s, digits=6))
