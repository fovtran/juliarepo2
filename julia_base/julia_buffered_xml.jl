using EzXML
using CodecZlib

function eenrekord(x)
    r = parsexml(string(x)) # This is where the process hangs - sometimes after 20 - 80 iterations.
    ut = nodecontent(findfirst(root(r), "//UID"))
    ut, string(r)
end

function xml_records(gzipfile,tabel,zipfile)
    l = GzipDecompressorStream(open(gzipfile))
    reader = EzXML.StreamReader(l)
    count = 0
    rcount = 0
    conn = dbcon()
    list = []
    while !done(reader)
        if nodetype(reader) == 1 && nodename(reader) == "REC"
            rcount += 1
            if rcount % 2 == 1
                x = expandtree(reader)
                ut, xml = eenrekord(x)
                push!(list, [zipfile, gzipfile, ut, xml])
                count +=1
                if count % 20000 == 0
                    println(count)
                   #  write_list_sql_table  - another function not shown here.     
                    list = []
                end
            end
        end
    end
    if telling % 20000 != 0
        println(count)
                   #  write_list_sql_table  - another function not shown here.     
    end
    close(conn)
end
gzipfile = "/tmp/some.xml.gz"
zipfile = "somezipfile.zip"
tabel = "core_2018"
xml_records(gzipfile,tabel,zipfile)