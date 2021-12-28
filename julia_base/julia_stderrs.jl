type MyUndefVarError <: Exception
	var::Symbol
end

Base.showerror(io::IO, e::MyUndefVarError) = print(io, e.var, " not defined");

showerror(STDOUT, UndefVarError(:foo))
UndefVarError: foo not defined

julia> showerror(STDOUT, MyUndefVarError(:foo))
foo not defined

julia> throw(UndefVarError(:foo))
ERROR: UndefVarError: foo not defined

julia> throw(MyUndefVarError(:foo))  # Should show `ERROR: foo not defined`
ERROR: MyUndefVarError(:foo)

if circumference > 0
	circumference/2π
elseif circumference == 0
	throw(DivideError())
else
	throw(DomainError())
end

throw(UndefVarError(:thisvariabledoesnotexist))

fussy_sqrt(x) = x >= 0 ? sqrt(x) : error("negative x not allowed")

type MyException <: Exception 
end
throw(MyException("this code"))

type MyExceptionTree <: Exception
	var::String
end
Base.showerror(io::IO, e::MyExceptionTree) = print(io, "Something is wrong with ", e.var, "!")

throw(MyException("this code"))

function resilient_square_root(x::Number)
	try
		sqrt(x)
	catch err
		if isa(err, DomainError)
			sqrt(complex(x))
		end
	end
end

try sqrt(x) catch y end
 try sqrt(x) catch; y end
 
f = open("file")
try
	# operate on file f
finally
	close(f)
end

info("This code is looking pretty good.")
warn("You're not looking too good. Best check yourself.")

backtrace()
catch_backtrace()