module test_lormock_data_dragon

using Test
using LoRMock.DataDragon

card = Card("01IO006")
@test card.regionRef == "Ionia"
@test card.attack == 2
@test card.cost == 2
@test card.health == 1
@test card.name == "Greenglade Duo"
@test card.cardCode == "01IO006"
@test card.keywords == ["Elusive"]
@test card.rarityRef == "Rare"
@test card.subtype == ""
@test card.type == "Unit"
@test card.collectible
@test haskey(SetBundles, card.cardCode)

using LoRDeckCodes
deck = Deck("CEAAECABAIDASDASDISC2OIIAECBGGY4FAWTINZ3AICACAQXDUPCWBABAQGSOKRM")
@test CardCodeAndCount("01IO006", 2) in deck.cards
@test card in deck
@test !(Card("01DE001") in deck)

end # module test_lormock_data_dragon
