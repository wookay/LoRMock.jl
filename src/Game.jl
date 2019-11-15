module Game # LoRMock

using ..LoRMock: DeckList, GameResult, PositionalRectangles, Screen, Rectangle
using LoRDeckCodes

current = Dict(
    :active => false,
    :decklist => DeckList(nothing, nothing),
    :gameresult => GameResult(0, false),
    :rectangles => PositionalRectangles(nothing, nothing, "Menus", Screen(1, 1), []),
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
        PositionalRectangles(nothing, nothing, "Menus", Screen(1, 1), [])
    end
end


module Client # LoRMock.Game

using ..Game
using Bukdu

struct GameController <: ApplicationController
    conn::Conn
end

function decklist(::GameController)
    list = Game.decklist()
    if nothing === list.CardsInDeck
        CardsInDeck = nothing
    else
        CardsInDeck = map(list.CardsInDeck) do card
            card.code => card.count
        end
    end
    render(JSON, (DeckCode=list.DeckCode, CardsInDeck=CardsInDeck))
end

function rectangles(::GameController)
    render(JSON, Game.rectangles())
end

function gameresult(::GameController)
    render(JSON, Game.gameresult())
end

function start(port)
    if !haskey(Game.current, :routes)
        routes() do
            get("/static-decklist", GameController, decklist)
            get("/positional-rectangles", GameController, rectangles)
            get("/game-result", GameController, gameresult)
        end
        Game.current[:routes] = true
    end
    Bukdu.start(port)
end

function stop()
    Bukdu.stop()
end

end # module LoRMock.Game.Client

end # module LoRMock.Game
