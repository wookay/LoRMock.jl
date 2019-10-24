using BinaryProvider

tarball_url = "https://dd.b.pvp.net/datadragon-set1-lite-en_us.zip"
hash = "3f3e174d49597f1e6c5136391b7be28a42dfda9df3842182b210a9a2de85389b" # using SHA; bytes2hex(sha256(read(file)))
prefix = Prefix(normpath(@__DIR__, "datadragon-set1-lite-en_us"))
!isinstalled(tarball_url, hash, prefix=prefix) && install(tarball_url, hash, prefix=prefix)

using JSON2

bundle_set = normpath(@__DIR__, "bundle_set.jl")
set1 = normpath(@__DIR__, "datadragon-set1-lite-en_us/en_us/data/set1-en_us.json")

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
