using BinaryProvider
using JSON2

### SetBundles

tarball_url = "https://dd.b.pvp.net/datadragon-set1-lite-en_us.zip"
hash = "5da75f2630e599095c9ebee3f647b85c17b17435ce202bc6b56025fc1b3ef5b6" # using SHA; bytes2hex(sha256(read(file)))
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
hash = "bd2af263096048a2085e9109f03f446e590f8d4e4b725d4a6ff65096352e5d2a" # using SHA; bytes2hex(sha256(read(file)))
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
