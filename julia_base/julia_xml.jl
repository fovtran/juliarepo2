using LightXML

<?xml version="1.0" encoding="UTF-8"?>
<bookstore>
  <book category="COOKING" tag="first">
    <title lang="en">Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    <year>2005</year>
    <price>30.00</price>
  </book>
  <book category="CHILDREN">
    <title lang="en">Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
  </book>
</bookstore>

# xdoc is an instance of XMLDocument, which maintains a tree structure
xdoc = parse_file("ex1.xml")
xroot = root(xdoc)  # an instance of XMLElement
println(name(xroot))  # this should print: bookstore

# traverse all its child nodes and print element names
for c in child_nodes(xroot)  # c is an instance of XMLNode
    println(nodetype(c))
    if is_elementnode(c)
        e = XMLElement(c)  # this makes an XMLElement instance
        println(name(e))
    end
end

free(xdoc)

ces = collect(child_elements(xroot))  # get a list of all child elements
@assert length(ces) == 2

# if you know the child element tagname, you can instead get a list as
ces = get_elements_by_tagname(xroot, "book")
# or shorthand:
ces = xroot["book"]

e1 = ces[1]  # the first book element

# print the value of an attribute
println(attribute(e1, "category"))

# find the first title element under e1
t = find_element(e1, "title")

# retrieve the value of lang attribute of t
a = attribute(t, "lang")  # a <- "en"

# retrieve the text content of t
r = content(t)  # r <- "Everyday Italian"

for a in attributes(e1)  # a is an instance of XMLAttr
    n = name(a)
    v = value(a)
    println("$n = $v")
end

ad = attributes_dict(e1)
v = ad["category"]  # v <-- "COOKING"

<?xml version="1.0" encoding="utf-8"?>
<States>
  <State tag="MA">Massachusetts</State>
  <State tag="IL" cap="Springfield">Illinois</State>
  <State tag="CA" cap="Sacramento">California</State>
</States>

# create an empty XML document
xdoc = XMLDocument()

# create & attach a root node
xroot = create_root(xdoc, "States")

# create the first child
xs1 = new_child(xroot, "State")

# add the inner content
add_text(xs1, "Massachusetts")

# set attribute
set_attribute(xs1, "tag", "MA")

# likewise for the second child
xs2 = new_child(xroot, "State")
add_text(xs2, "Illinois")
# set multiple attributes using a dict
set_attributes(xs2, {"tag"=>"IL", "cap"=>"Springfield"})

# now, the third child
xs3 = new_child(xroot, "State")
add_text(xs3, "California")
# set attributes using keyword arguments
set_attributes(xs3; tag="CA", cap="Sacramento")

# save to an XML file
save_file(xdoc, "f1.xml")

# output to a string
s = string(xdoc)

# print to the console (in a pretty format as in an XML file)
print(xdoc)