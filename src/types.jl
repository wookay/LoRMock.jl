# module LoRMock

using LoRDeckCodes: Card

struct DeckList
    DeckCode::Union{Nothing,String}
    CardsInDeck::Union{Nothing,Vector{Card}}
end

# module LoRMock
