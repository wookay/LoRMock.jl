module DataDragon # LoRMock

export Card, BundleSet

using ..LoRMock: Card

include(normpath(@__DIR__, "..", "gen", "bundle_set.jl"))

function Card(code::String)::Card
    (first ∘ filter)(c -> c.cardCode == code, BundleSet)
end

end # LoRMock.DataDragon
