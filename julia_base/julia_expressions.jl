z = begin
   x = 1
   y = 2
   x + y
end

z = (x = 1; y = 2; x + y)
begin x = 1; y = 2; x + y end
(x = 1; y = 2; x + y)

if x < y
    println("x is less than y")
elseif x > y
    println("x is greater than y")
else
    println("x is equal to y")
end

test(x, y) = println(x < y ? "x is less than y"    :
                            x > y ? "x is greater than y" : "x is equal to y")
							
 function fact(n::Int)
   n >= 0 || error("n must be non-negative")
   n == 0 && return 1
   n * fact(n-1)
end
 fact(23)
 
i = 1;
while true
   println(i)
   if i >= 5
	   break
   end
   global i += 1
end

for j = 1:1000
   println(j)
   if j >= 5
	   break
   end
end

 for i = 1:10
   if i % 3 != 0
	   continue
   end
   println(i)
end

for i = 1:2, j = 3:4
   println((i, j))
end

f(x) = x>=0 ? exp(-x) : throw(DomainError(x, "argument must be nonnegative"))
typeof(DomainError(nothing)) <: Exception
typeof(DomainError) <: Exception

struct MyUndefVarError <: Exception
   var::Symbol
end
Base.showerror(io::IO, e::MyUndefVarError) = print(io, e.var, " not defined")

sqrt_second(x) = try
   sqrt(x[2])
catch y
   if isa(y, DomainError)
	   sqrt(complex(x[2], 0))
   elseif isa(y, BoundsError)
	   sqrt(x)
   end
end

try bad() catch; x end

function mytask(myarg)
    ...
end

taskHdl = Task(() -> mytask(7))
# or, equivalently
taskHdl = @task mytask(7)

a1() = sum(i for i in 1:1000);
b = @task a1();
istaskstarted(b)
schedule(b);
yield();
istaskdone(b)