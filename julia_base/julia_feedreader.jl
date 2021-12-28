using Cascadia
using Gumbo
using Requests

r = get("http://stackoverflow.com/questions/tagged/julia-lang")
h = parsehtml(convert(String, r.data))

qs = eachmatch(Selector(".question-summary"),h.root)

println("StackOverflow Julia Questions (votes  answered?  url)")

for q in qs
    votes = nodeText(eachmatch(Selector(".votes .vote-count-post "), q)[1])
    answered = length(eachmatch(Selector(".status.answered"), q)) > 0
    href = eachmatch(Selector(".question-hyperlink"), q)[1].attributes["href"]
    println("$votes  $answered  http://stackoverflow.com$href")
end