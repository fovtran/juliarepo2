using Electron
app = Application()

using Electron, URIParser
app = Application()
win = Window(app, URI("file://main.html"))
load(win, URI("http://julialang.org"))
load(win, """
<img src="https://raw.githubusercontent.com/JuliaGraphics/julia-logo-graphics/master/images/julia-logo-325-by-225.png">
""")

using Electron, URIParser
win = Window(URI("file://main.html"))

using Electron, URIParser
app = Application()
result = run(app, "Math.log(10)")

using Electron, URIParser
win = Window(URI("file://main.html"))
result = run(win, "Math.log(10)")

using Electron
win = Window()
result = run(win, "sendMessageToJulia('foo')")
ch = msgchannel(win)
msg = take!(ch)
println(msg)