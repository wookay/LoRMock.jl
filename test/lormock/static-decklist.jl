module test_lormock_static_decklist

using Test
using LoRMock # Game DeckList
using LoRDeckCodes # CardCodeAndCount

Game.set_active(false)
@test Game.decklist() == DeckList(nothing, nothing)

# port = 21337
# "http://localhost:$port/static-decklist"

const C = CardCodeAndCount

Game.set_active(true)
Game.set_decklist("CEBAMAIFB4RCQKRUGYBACARRHEBAIAIFAEBRIKYBAEBAEAQCAECRKMIEAEBAOIJOHA")
@test Game.decklist() == DeckList("CEBAMAIFB4RCQKRUGYBACARRHEBAIAIFAEBRIKYBAEBAEAQCAECRKMIEAEBAOIJOHA", [C("01SI015", 3), C("01SI034", 3), C("01SI040", 3), C("01SI042", 3), C("01SI052", 3), C("01SI054", 3), C("01IO049", 3), C("01IO057", 3), C("01SI001", 2), C("01SI003", 2), C("01SI020", 2), C("01SI043", 2), C("01IO002", 2), C("01SI021", 1), C("01SI049", 1), C("01IO007", 1), C("01IO033", 1), C("01IO046", 1), C("01IO056", 1)])

#=
{
    "DeckCode": "DECKCODE",
    "CardsInDeck": {
        "01DE000": 1,
        "01DE001": 2,
        ...
    }
}
=#

#=
{
    "DeckCode": null,
    "CardsInDeck": null
}
=#

end # module test_lormock_static_decklist
