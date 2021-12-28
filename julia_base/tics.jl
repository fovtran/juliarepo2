tic()
for iidata = 1:num_data_sets
    @printf("*")

    for ii = 1:num_trials
        @printf(".")
        #@printf("  trial %d\n", ii)
        y, ystar, X = generate_equal_size_random_regression_data(k, n, d, sigma);

        for (algo_name, algo_fun) in algos
            #@printf("    algorithm %s\n", algo_name)
            start_time = time_ns()
            yhat_partition = algo_fun(X, y, k)
            end_time = time_ns()
            yhat = partition_to_vector(X, yhat_partition)
            mses[algo_name][nii, (iidata - 1) * num_trials + ii] = mse(yhat, ystar)
            times[algo_name][nii, (iidata - 1) * num_trials + ii] = 1e-9 * (end_time - start_time)
        end
    end
end
elapsed = toq()
@printf("  %f seconds\n", elapsed)
