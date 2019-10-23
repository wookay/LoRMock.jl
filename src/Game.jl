module Game # LoRMock

using ..LoRMock: DeckList
using LoRDeckCodes

current = Dict(
    :active => false,
    :decklist => DeckList(nothing, nothing),
)

function decklist()::DeckList
    if current[:active]
        current[:decklist]
    else
        DeckList(nothing, nothing)
    end
end

function set_active(active::Bool)
    current[:active] = active
end

function set_decklist(deckcode::String)
    deck = Deck(deckcode)
    current[:decklist] = DeckList(deckcode, deck.cards)
end

Base.:(==)(a::DeckList, b::DeckList) = a.DeckCode == b.DeckCode && a.CardsInDeck == b.CardsInDeck

end # module LoRMock.Game
