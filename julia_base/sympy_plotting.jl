using SymPy
x = SymPy.symbols("x")
y = 2x^2
using Plots
pyplot()
plot(x,y)

using PyCall			
@pyimport sympy
x = sympy.Symbol("x")
y = sympy.sin(x)
y[:subs](x, sympy.pi) |> float

using ImageView, Images
img = Images.load("c:/users/logicaudio/desktop/img-8143.jpg")

using TestImages
img = testimage("mandrill")

imshow(img)
img = testimage("mri")
imshow(img)

imshow(img, axes=(:S, :P), flipy=true)  # a sagittal plane (Superior, Posterior)

using ImageView, TestImages, Gtk.ShortNames
grid, frames, canvases = canvasgrid((1,2))  # 1 row, 2 columns
imshow(canvases[1,1], testimage("lighthouse"))
imshow(canvases[1,2], testimage("mandrill"))
win = Window(grid)
Gtk.showall(win)
