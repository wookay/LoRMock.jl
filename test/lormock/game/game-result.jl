module test_lormock_game_result

using Test
using LoRMock

@test Game.gameresult() == GameResult(0, false)

end # module test_lormock_game_result
