module test_lormock_positional_rectangles

using Test
using LoRMock

@test Game.rectangles() == PositionalRectangles(nothing, nothing, "Menus", Screen(1, 1), [])

#=
{
    "PlayerName": "Riot Tuxedo",
    "OpponentName": "Riot Gene",
    "GameState": "InProgress",
    "Screen": {
        "ScreenWidth": 1920,
        "ScreenHeight": 1200
    },
    "Rectangles": [
        {
            "CardID": 0,
            "CardCode": "01DE001",
            "TopLeftX": 800,
            "TopLeftY": 900,
            "Width": 252,
            "Height": 373
        },
        ...
    ]
}

{
    "PlayerName": null,
    "OpponentName": null,
    "GameState": "Menus",
    "Screen": {
        "ScreenWidth": 1,
        "ScreenHeight": 1
    },
    "Rectangles": []
}
=#

end # module test_lormock_positional_rectangles
