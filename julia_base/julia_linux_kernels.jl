using HTTP
using LightXML
using Gumbo
using Cascadia

feed = "https://www.kernel.org/feeds/kdist.xml"
#doc = download(feed)
# xdoc = LightXML.parse_file(doc)
xdoc = LightXML.parse_string(String(HTTP.get(feed).body))
xroot = root(xdoc)
println(name(xroot))

function getdesc(h)
	i = Cascadia.eachmatch(Selector("td:contains(\"a\")"), h.root)
	files = (AbstractString)[]
	for x in i
		files = vcat(files, get(x[1].attributes, "href", 0))
	end
	return files
end

for c in child_nodes(xroot)  # c is an instance of XMLNode
    if is_elementnode(c)
        rss = XMLElement(c)  # this makes an XMLElement instance
		for item in child_nodes(rss)
			if is_elementnode(item)
				if name(item)=="item"
					number = ""
					ktype = ""
					pubdate = ""
					files = []
					pubDate = content(XMLElement(item)["pubDate"][1])
					title = split(content(XMLElement(item)["title"][1]))
					knumber = title[1][1:end-1]
					terms = title[2]
					desc = parsehtml( content(XMLElement(item)["description"][1]) )
					println(title)
					print(getdesc(desc))
				end
			end
		end
	end
end

#=
for c in child_nodes(xroot)  # c is an instance of XMLNode
    if is_elementnode(c)
        rss = XMLElement(c)  # this makes an XMLElement instance
		for item in child_nodes(rss)
			if is_elementnode(item)
				if name(item)=="item"
					number = ""
					ktype = ""
					pubdate = ""
					files = []
					pubDate = content(XMLElement(item)["pubDate"][1])
					print(pubDate)
					for kerneldata in child_nodes(item)					
						f = XMLElement(kerneldata)						
						if name(f)=="pubDate"
							pubdate = content(f)
						end
						if name(f)=="title"
							temp = split(content(f))
							number = temp[1][1:end-1]
							ktype = temp[2]
						end						
						if name(f)=="description"
							h = parsehtml( content(f) )
							i = Cascadia.eachmatch(Selector("td:contains(\"a\")"), h.root)
							for x in i
								files = vcat(files, get(x[1].attributes, "href", 0))
							end
						end						
					end
					kernel = Dict("knumber" => number, ktype => ktype, "pubdate" => pubdate, "files" => files)
					#print(kernel)
				end
			end
		end        
    end
end
=#

free(xroot)
free(xdoc)