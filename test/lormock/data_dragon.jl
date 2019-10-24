module test_lormock_data_dragon

using Test
using LoRMock.DataDragon

card = Card("01DE001")
@test card.regionRef == "Demacia"
@test card.attack == 3
@test card.cost == 4
@test card.health == 3
@test card.name == "Vanguard Bannerman"
@test card.cardCode == "01DE001"
@test card.rarityRef == "Rare"
@test card.subtype == "Elite"
@test card.type == "Unit"
@test card.collectible
@test first(filter(c -> c.cardCode == "01DE001", BundleSet)) == card

end # module test_lormock_data_dragon
