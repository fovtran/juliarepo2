Pkg.add("DPMMSubClusters")

using DPMMSubClusters

x,y,clusters = generate_gaussian_data(10000,2,6,100.0)

ret_values= fit(x,10.0, iters = 100,burnout = 10, gt = y)

labels = ret_values[1]n