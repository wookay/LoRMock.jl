using JSON2

bundle_set = normpath(@__DIR__, "bundle_set.jl")
set1 = normpath(@__DIR__, "../deps/datadragon-set1-lite-en_us/en_us/data/set1-en_us.json")

include(normpath(@__DIR__, "../src/types.jl"))
function Card(nt::NamedTuple)
    fields = fieldnames(Card)
    Card((x -> getindex(nt, x)).(fields)...)
end

f = open(bundle_set, "w")
write(f, "# generated\n")
write(f, "BundleSet = Card[\n")
for nt in JSON2.read(read(set1, String))
    card = Card(nt)
    write(f, repeat(' ', 4), repr(card), ",\n")
end
write(f, "]\n")
close(f)
