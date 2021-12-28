Pkg.status()
versioninfo()
 
using Dates
last_modified = sort(map(f -> (realpath(f), Dates.unix2datetime(mtime(f))), dir("d:/datasa/")), by = last, rev = true)

Dates.unix2datetime(mtime("d:/datasa/"))
(r, d, f) = walkdir("d:/datasa/", topdown=true)

Base.crc32c(read(filename))
@btime Base.crc32c(Mmap.mmap("./ml10m.rda"))
function checksum(filename, blocksize=16384)
    crc = zero(UInt32)
    open(filename, "r") do f
        while !eof(f)
            crc = Base.crc32c(read(f, blocksize), crc)
        end
    end
    return crc
end

using SHA
bytes2hex(sha256("test"))
open("/tmp/test.txt") do f
 sha2_256(f)
end
bytes2hex(sha256(read("c:/users/logicaudio/desktop/img-8143.jpg")))
bytes2hex(sha256(open("c:/users/logicaudio/desktop/img-8143.jpg")))
using Mmap
bytes2hex(sha256(Mmap.mmap("c:/users/logicaudio/desktop/img-8143.jpg")))

pwd()

cd(readdir, "/home/JuliaUser/Projects/julia")

readdir("/home/JuliaUser/Projects/julia")

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

mkpath("my/test/dir");
itr = walkdir("my");
(root, dirs, files) = first(itr)
(root, dirs, files) = first(itr)
(root, dirs, files) = first(itr)

stat(file)
lstat(file)
ctime(file)
mtime(file)
touch("my_little_file");
filemode(file)
filesize(path...)
uperm(file)
gperm(file)
operm(file)
download(url::AbstractString, [localfile::AbstractString])
write("hello.txt", "world");
readline("goodbye.txt")
"hello.txt" in readdir()
rm("goodbye.txt");
tempname()
mktemp(parent=tempdir())
mktempdir(parent=tempdir())
isdir(homedir())
f = open("test_file.txt", "w");
isfile(f)
close(f); rm("test_file.txt")
ispath(path)
homedir()
dirname("/home/myuser")
basename("/home/myuser/example.jl")
isabspath("/home")
isdirpath("/home")
joinpath("/home/myuser", "example.jl")
normpath("/home/myuser/../example.jl")
splitdir("/home/myuser")
splitext("/home/myuser/example.jl")
splitpath("/home/myuser/example.jl")

using Dates
function get_last_modified(path)
    last_modified = first(sort(map(f -> (realpath(f), Dates.unix2datetime(mtime(f))), readdir(path)), by = last, rev = true))[1]
    return last_modified
end

function get_last_modified(path)
    wd = pwd()
    cd(path)
    last_modified = first(sort(map(f -> (realpath(f), Dates.unix2datetime(mtime(f))), readdir(path)), by = last, rev = true))[1]
    cd(wd)
    return last_modified
end

