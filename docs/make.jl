using SimpleAlgebra
using Documenter

DocMeta.setdocmeta!(SimpleAlgebra, :DocTestSetup, :(using SimpleAlgebra); recursive=true)

makedocs(;
    modules=[SimpleAlgebra],
    authors="sglez",
    sitename="SimpleAlgebra.jl",
    format=Documenter.HTML(;
        canonical="https://Cglezf.github.io/SimpleAlgebra.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=["Home" => "index.md"],
)

deploydocs(; repo="github.com/Cglezf/SimpleAlgebra.jl", devbranch="main")
