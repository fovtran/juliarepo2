# using Pkg
# Pkg.build("Genie")
# Pkg.add("Glob")
# using Glob
# glob("foo*.txt","path/to/dir")

using Distributed
addprocs(4)
using Base.Threads
using SharedArrays

function test2()
    len=10000000
    a = zeros(len)
    @inbounds @threads for i in 1:len
        a[i] = rand()^3 #here goes my function
    end
    return a
end

curdir= pwd()
homedir = homedir()
cd(homedir)
newpath = joinpath(homedir, "dmc.exchange")
mkpath(newpath);

itr = walkdir("d:/datasa")
(root,dirs,files) = first(itr)
"venus.txt" in files
isdir(path)
isfifo(path)
isfile(homedir())

tempname()
mktempdir(parent=tempdir(); prefix="jl_")
dirname("/home/myuser")
basename("/home/myuser/example.jl")
isabspath("/home")
isdirpath("/home/")
joinpath("/home/myuser", "example.jl")
normpath("/home/myuser/../example.jl")
splitdir("/home/myuser")
splitext("/home/myuser/example.jl")
splitpath("/home/myuser/example.jl")

write("hello.txt", "world");
"hello.txt" in readdir()
readline("goodbye.txt")
rm("goodbye.txt");

ispath(path)
f = open("test_file.txt", "w");
isfile(f)
close(f); rm("test_file.txt")

readdir("/home/JuliaUser/Projects/julia")
walkdir(dir; topdown=true, follow_symlinks=false, onerror=throw)

for (root, dirs, files) in walkdir(".")
    println("Directories in $root")
    for dir in dirs
        println(joinpath(root, dir)) # path to directories
    end
    println("Files in $root")
    for file in files
        println(joinpath(root, file)) # path to files
    end
end
