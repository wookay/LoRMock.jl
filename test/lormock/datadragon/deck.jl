module test_lormock_datadragon_deck

using Test
using LoRDeckCodes

# Legends of Runeterra Official
# https://lor.mobalytics.gg/ko_kr/e7e3c2ea-722d-46ef-aba3-5145ef427806

deck_codes_official = """
CEBAIAIFAEHSQNQIAEAQGDAUDAQSOKJUAIAQCBI5AEAQCFYA # asia 1
CEAQYAIAAECBEFAWDQRCIJRHFUZQCAQBAAHCSAA # asia 2
CEAAECABAQJBGGZIFIWDIOYJAEBAMCIMCINB4JBRHEBAGAIEBEGSOAYBAILRQKY # asia 3
CEBAEAIFFA2AOAIBAMDQYFBBE4UQEAIBAE2AGAIFAEHTMAQBAEAROBABAUBRIGJD # asia 4
CEAAEAYBAABQMCYKAEBQIBYMB4JROGRGFY3QEBQBAMBASDQWFI2QQAIAAIDQYFI3FIWDG # asia 5 

CEBAKAICAYEQ2GZRBAAQKBIHCULR6IRGFIAACAIBAUBQ # americas 1
CEBAIAIFAEHSQNQIAEAQGDAUDAQSOKJUAIAQCBI5AEAQCFYA # americas 2
CEBACAIDFIDQCAQGBAIRULBRHEBAEAICAILAGAIDBQKBWAQBAEBASBIBAMMSGKZWG4 # americas 3
CEBAIAIABEOSKLIHAEBAMEQTEAYTOOIBAEAQAEQCAIAQEGA6AMAQABZJGM # americas 4
CEBAKAIDBQIRWJZLA4AQIDANCIOCMKBNAEBACAY2EYAA # americas 5

CEBAIAIFAEHSQNQIAEAQGDAUDAQSOKJUAIAQCBI5AEAQCFYA # europe 1
CEBACAIDCQFACAABAICAMCQTDURCOMYBAMAQADYWDIAQCAIABQ # europe 2
CEBAEAICAIYQQAIBAMDQSFAWEEUTCAQBAEATIAYBAIQS2OICAEAQEHABAEASO # europe 3
CEAQGAIBAMKCCAQEAECQ6FBDGQEACAILCYSCMJZIGI2AEAYBAUBSCNQEAEAQOEZJFI # europe 4
CEBAIAIFAEOSQNQJAECAIDQ3D4SDANBYHEAACAIBAQYQ # europe 5
"""

function Base.parse(::Type{Vector{Deck}}, deck_codes::String)
    decks = Vector{Deck}()
    for line in split(deck_codes, "\n")
        if !isempty(line)
            (deckcode,) = split(line, " ")
            deck = Deck(deckcode)
            push!(decks, deck)
        end 
    end
    decks
end

decks = parse(Vector{Deck}, deck_codes_official)
@test length(decks) == 15

end # module test_lormock_datadragon_deck
