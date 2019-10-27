# module LoRMock

using LoRDeckCodes: CardCodeAndCount

struct Card
    associatedCardRefs::Vector{String}
    regionRef::String
    attack::Int
    cost::Int
    health::Int
    descriptionRaw::String
    flavorText::String
    artistName::String
    name::String
    cardCode::String
    keywords::Vector{String}
    spellSpeedRef::String
    rarityRef::String
    subtype::String
    supertype::String
    type::String
    collectible::Bool
end

struct DeckList
    DeckCode::Union{Nothing,String}
    CardsInDeck::Union{Nothing,Vector{CardCodeAndCount}}
end

struct GameResult
    GameID::Int
    LocalPlayerWon::Bool
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
    GameState::String
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
