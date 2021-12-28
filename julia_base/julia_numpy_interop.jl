import numpy
a = numpy.asarray([ [1,2,3], [4,5,6], [7,8,9] ])
numpy.savetxt("foo.csv", a, delimiter=",")

import pandas as pd 
pd.DataFrame(np_array).to_csv("path/to/file.csv")

import numpy as np
a = np.asarray([ [1,2,3], [4,5,6], [7,8,9] ])
a.tofile('foo.csv',sep=',',format='%10.5f')

import numpy as np

# Write an example CSV file with headers on first line
with open('example.csv', 'w') as fp:
    fp.write('''col1,col2,col3 1,100.1,string1 2,222.2,second string''')

ar = np.recfromcsv('example.csv')
print(repr(ar))
# rec.array([(1, 100.1, 'string1'), (2, 222.2, 'second string')], dtype=[('col1', '<i4'), ('col2', '<f8'), ('col3', 'S13')])

with open('out.csv', 'w') as fp:
    fp.write(','.join(ar.dtype.names) + '\n')
    np.savetxt(fp, ar, '%s', ',')


# JULIA	
using DataFrames, CSV
d= CSV.read( stdin )
CSV.File("abc.csv"; allowmissing=:none, limit=5)

using JuliaDB 
flights = loadtable("Document.csv")

function buildtable(filter::Function, file)
    f = CSV.File(file)
    # create a NamedTuple of Vectors to push! to
    table = (colA=Int[], colB=Float64[], colC=String[])
    for row in f
        if filter(row)
            push!(table.colA, row.colA)
            push!(table.colB, row.colB)
            push!(table.colC, row.colC)
        end
    end
    return table
end

function readtest()
    i = 1
    for row in CSV.File("abc.csv"; allowmissing=:none)   
        i += 1
        if i > 5
            break
        end
    end  
end

# BPY
import bpy

outputFile = 'C:/someFolder/mesh.csv'
verts = [ bpy.context.object.matrix_world * v.co for v in bpy.context.object.data.vertices ]
csvLines = [ ";".join([ str(v) for v in co ]) + "\n" for co in verts ]
f = open( outputFile, 'w' )
f.writelines( csvLines )
f.close()
readtest()

# FreeCAD
obj = FreeCADGui.Selection.getSelection()

bom = App.activeDocument().addObject('Spreadsheet::Sheet','BOM')
cell = 0
for x in obj:
    cell = cell + 1
    bom.set("A" + str(cell), x.Label)

App.ActiveDocument.recompute()