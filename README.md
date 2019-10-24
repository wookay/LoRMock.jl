# LoRMock.jl

|  **Build Status**                                                |
|:----------------------------------------------------------------:|
|  [![][travis-img]][travis-url]  [![][codecov-img]][codecov-url]  |


```julia
julia> using LoRMock.DataDragon

julia> card = Card("01DE001")
Card(String[], "Demacia", 3, 4, 3, "Allegiance: Grant all allies +1|+1.", "\"You must understand the weight of our banner. It flies for our king, our houses, our citizens. It is our unwavering belief in Demacia itself. Hold it high. Show them our pride.\" - Tianna Crownguard ", "SIXMOREVODKA", "Vanguard Bannerman", "01DE001", String[], "", "Rare", "Elite", "", "Unit", true)
```

### Installation
```
$ julia -e 'using Pkg; pkg"registry add https://github.com/JuliaRegistries/General.git"'
$ julia -e 'using Pkg; pkg"registry add https://github.com/wookay/Registro.git"'
$ julia -e 'using Pkg; pkg"up"'
$ julia -e 'using Pkg; pkg"add LoRMock"'
```

[travis-img]: https://api.travis-ci.org/wookay/LoRMock.jl.svg?branch=master
[travis-url]: https://travis-ci.org/wookay/LoRMock.jl

[codecov-img]: https://codecov.io/gh/wookay/LoRMock.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/wookay/LoRMock.jl/branch/master
