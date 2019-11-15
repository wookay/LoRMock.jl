using Jive
@useinside module test_lormock_game_client

using Test
using LoRMock.Game
using HTTP

Client = Game.Client

port = 8190
Client.start(port)

r = HTTP.get("http://127.0.0.1:$port/game-result")
@test r.body == """{"GameID":0,"LocalPlayerWon":false}""" |> Vector{UInt8}

r = HTTP.get("http://127.0.0.1:$port/positional-rectangles")
@test r.body == """{"PlayerName":null,"OpponentName":null,"GameState":"Menus","Screen":{"ScreenWidth":1,"ScreenHeight":1},"Rectangles":[]}""" |> Vector{UInt8}

r = HTTP.get("http://127.0.0.1:$port/static-decklist")
@test r.body == """{"DeckCode":null,"CardsInDeck":null}""" |> Vector{UInt8}

Game.set_active(true)
Game.set_decklist("CEBAMAIFB4RCQKRUGYBACARRHEBAIAIFAEBRIKYBAEBAEAQCAECRKMIEAEBAOIJOHA")

r = HTTP.get("http://127.0.0.1:$port/static-decklist")
@test r.body == """{"DeckCode":"CEBAMAIFB4RCQKRUGYBACARRHEBAIAIFAEBRIKYBAEBAEAQCAECRKMIEAEBAOIJOHA","CardsInDeck":[{"01SI015":3},{"01SI034":3},{"01SI040":3},{"01SI042":3},{"01SI052":3},{"01SI054":3},{"01IO049":3},{"01IO057":3},{"01SI001":2},{"01SI003":2},{"01SI020":2},{"01SI043":2},{"01IO002":2},{"01SI021":1},{"01SI049":1},{"01IO007":1},{"01IO033":1},{"01IO046":1},{"01IO056":1}]}""" |> Vector{UInt8}

Client.stop()

end # module test_lormock_game_client
