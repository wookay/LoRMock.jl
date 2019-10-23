# module LoRMock

using LoRDeckCodes: Card

struct DeckList
    DeckCode::Union{Nothing,String}
    CardsInDeck::Union{Nothing,Vector{Card}}
end

struct GameResult
    GameID::Int
    LocalPlayerWon::Bool
end

struct GameState
    state::String # InProgress Menus
end

struct Screen
    ScreenWidth::Int
    ScreenHeight::Int
end

struct Rectangle
    CardID::Int
    CardCode::String
    TopLeftX::Int
    TopLeftY::Int
    Width::Int
    Height::Int
end

struct PositionalRectangles
    PlayerName::Union{Nothing,String}
    OpponentName::Union{Nothing,String}
    GameState::GameState
    Screen::Screen
    Rectangles::Vector{Rectangle}
end

function Base.:(==)(a::DeckList, b::DeckList)
    a.DeckCode == b.DeckCode && a.CardsInDeck == b.CardsInDeck
end

function Base.:(==)(a::PositionalRectangles, b::PositionalRectangles)
    a.PlayerName == b.PlayerName &&
        a.OpponentName == b.OpponentName &&
        a.GameState == b.GameState &&
        a.Screen == b.Screen &&
        a.Rectangles == b.Rectangles
end

# module LoRMock
