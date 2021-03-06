function polar(x, y)
	# Returns polar coordinates
	r = hypot(x, y)
	theta = atan(y, x)
	return r, theta
end

function succ(x, step=1; count=1)
x + count * step
end

A = [ 1 -5 3 2 4 0 ]
A = [ exp(x[i]) * sin(y[j]) for i=1:m, j=1:n ]

using Pkg
Pkg.add("GLFW")
import GLFW
window = GLFW.CreateWindow(640, 480, "GLFW.jl")
GLFW.MakeContextCurrent(window)

# Loop until the user closes the window
while !GLFW.WindowShouldClose(window)

    	# Render here
		#const win = Screen()
				
    	# Swap front and back buffers
    	GLFW.SwapBuffers(window)

    	# Poll for and process events
    	GLFW.PollEvents()
end

using GLFW

# Note: This was written as a quick test for multiwindow support.
# It is not a clean example (yet) of the proper way to do it.

windows = []
glClear = Dict{GLFW.Window, Function}()
for i in 1:3
	name = "Window $i"
	window = GLFW.CreateWindow(640, 480, name)
	GLFW.MakeContextCurrent(window)
	GLFW.SetMouseButtonCallback(window, (_, button, action, mods) -> begin
		if action == GLFW.PRESS
			println(name)
		end
	end)
	glClearFunc() = ccall(@eval(GLFW.GetProcAddress("glClear")), Cvoid, (Cuint,), 0x00004000)
	glClear[window] = glClearFunc 
	push!(windows, window)
end

# Force garbage collection so that improper reference management is more apparent via crashes
GC.gc() 

while !any(GLFW.WindowShouldClose, windows)
	for window in windows
		GLFW.MakeContextCurrent(window)
		glClear[window]()
		GLFW.SwapBuffers(window)
	end
	GLFW.WaitEvents()
end

for window in windows
	GLFW.DestroyWindow(window)
end