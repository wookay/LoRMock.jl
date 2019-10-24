using BinaryProvider

tarball_url = "https://dd.b.pvp.net/datadragon-set1-lite-en_us.zip"
hash = "3f3e174d49597f1e6c5136391b7be28a42dfda9df3842182b210a9a2de85389b" # using SHA; bytes2hex(sha256(read(file)))
prefix = Prefix(normpath(@__DIR__, "datadragon-set1-lite-en_us"))
!isinstalled(tarball_url, hash, prefix=prefix) && install(tarball_url, hash, prefix=prefix)
