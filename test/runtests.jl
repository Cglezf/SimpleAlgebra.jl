using SimpleAlgebra
using Test

include("arithmetic_test.jl")
using .ArithmeticTest

@testset "SimpleAlgebra Tests" begin
    test_arithmetic()
end

try
    using Coverage
    # Guarda el reporte en el formato que espera Codecov
    coverage = Coverage.process_folder(joinpath(@__DIR__, "../src"))
    LCOV.writefile("lcov.info", coverage)
catch err
    @warn "Coverage failed" exception = (err, catch_backtrace())
end

# Borrar archivos .cov después de generar lcov.info en los subdirectorios
for (root, dirs, files) in walkdir(joinpath(@__DIR__, ".."))
    for file in files
        endswith(file, ".cov") && rm(joinpath(root, file); force=true)
    end
end
