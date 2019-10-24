module DataDragon # LoRMock

export Card, SetBundles, CoreBundles

using ..LoRMock: Card
using LoRDeckCodes: Deck

include(normpath(@__DIR__, "..", "gen", "set_bundles.jl"))
include(normpath(@__DIR__, "..", "gen", "CoreBundles.jl"))

function Card(code::String)::Card
    getindex(SetBundles, code)
end

function Base.in(card::Card, deck::Deck)::Bool
    for c in deck.cards
        card.cardCode == c.code && return true
    end
    false
end

end # LoRMock.DataDragon
