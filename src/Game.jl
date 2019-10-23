module Game # LoRMock

using ..LoRMock: DeckList, GameResult, PositionalRectangles, GameState, Screen, Rectangle
using LoRDeckCodes

current = Dict(
    :active => false,
    :decklist => DeckList(nothing, nothing),
    :gameresult => GameResult(0, false),
    :rectangles => PositionalRectangles(nothing, nothing, GameState("Menus"), Screen(1, 1), []),
)

function set_active(active::Bool)
    current[:active] = active
end

function decklist()::DeckList
    if current[:active]
        current[:decklist]
    else
        DeckList(nothing, nothing)
    end
end

function set_decklist(deckcode::String)
    deck = Deck(deckcode)
    current[:decklist] = DeckList(deckcode, deck.cards)
end

function gameresult()::GameResult
    current[:gameresult]
end

function set_gameresult(GameID::Int, LocalPlayerWon::Bool)
    current[:gameresult] = GameResult(GameID, LocalPlayerWon)
end

function set_rectangles(rectangles::PositionalRectangles)
    current[:rectangles] = rectangles
end

function rectangles()::PositionalRectangles
    if current[:active]
        current[:rectangles]
    else
        PositionalRectangles(nothing, nothing, GameState("Menus"), Screen(1, 1), [])
    end
end

end # module LoRMock.Game
