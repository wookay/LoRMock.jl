using BinaryProvider
using JSON2

### SetBundles

tarball_url = "https://dd.b.pvp.net/datadragon-set1-lite-en_us.zip"
hash = "3f3e174d49597f1e6c5136391b7be28a42dfda9df3842182b210a9a2de85389b" # using SHA; bytes2hex(sha256(read(file)))
prefix = Prefix(normpath(@__DIR__, "datadragon-set1-lite-en_us"))
!isinstalled(tarball_url, hash, prefix=prefix) && install(tarball_url, hash, prefix=prefix)

set_bundles = normpath(@__DIR__, "set_bundles.jl")
set1 = normpath(@__DIR__, "datadragon-set1-lite-en_us/en_us/data/set1-en_us.json")

include(normpath(@__DIR__, "../src/types.jl"))
function Card(nt::NamedTuple)
    fields = fieldnames(Card)
    Card((x -> getindex(nt, x)).(fields)...)
end

f = open(set_bundles, "w")
write(f, "# generated\n")
write(f, "SetBundles = Dict{String,Card}(\n")
for nt in JSON2.read(read(set1, String))
    card = Card(nt)
    write(f, repeat(' ', 4), repr(card.cardCode), " => ", repr(card), ",\n")
end
write(f, ")\n")
close(f)


### CoreBundles

tarball_url = "https://dd.b.pvp.net/datadragon-core-en_us.zip"
hash = "8d1441feb2b58a52e6dd1b4bd13c4d7c243df6033ecffcda455a7e35f4b7c6f5" # using SHA; bytes2hex(sha256(read(file)))
prefix = Prefix(normpath(@__DIR__, "datadragon-core-en_us"))
!isinstalled(tarball_url, hash, prefix=prefix) && install(tarball_url, hash, prefix=prefix)

core_bundles = normpath(@__DIR__, "CoreBundles.jl")
globals = normpath(@__DIR__, "datadragon-core-en_us/en_us/data/globals-en_us.json")

f = open(core_bundles, "w")
write(f, "# generated\n")
write(f, "module CoreBundles # LoRMock.DataDragon\n\n")
g = JSON2.read(read(globals, String))

function write_nameref(f::IO, g, key)
    write(f, String(key), " = [\n")
    for k in getfield(g, key)
        write(f, repeat(' ', 4), repr(k.nameRef), ",\n")
    end
    write(f, "]\n\n")
end

write_nameref(f, g, :keywords)
write_nameref(f, g, :regions)
write_nameref(f, g, :spellSpeeds)
write_nameref(f, g, :rarities)

write(f, "end # module LoRMock.DataDragon.CoreBundles")

close(f)
