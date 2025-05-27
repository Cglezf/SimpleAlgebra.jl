using SimpleAlgebra
using Test
using Coverage

include("arithmetic_test.jl")

@testset "SimpleAlgebra sums" begin
    @test add(ScalarOp(2, 3)) == 5
    @test add(ScalarOp(0, 0)) == 0
    @test add(ScalarOp(-1, 1)) == 0
    @test add(ScalarOp(-1, -1)) == -2
    @test add(ScalarOp(0.5, 0.5)) == 1.0
    @test add(ScalarOp(1//2, 2//3)) == 7//6
end
@testset "SimpleAlgebra types" begin
    @test isapprox(add(ScalarOp(0.1, 0.2)), 0.3; atol=1e-10)
    @test_throws MethodError add(1 + 2im, 3 + 4im)
    @test_throws MethodError add(1, 0 + 0im, 2.0 - 1im)
end

# Guarda el reporte en el formato que espera Codecov
coverage = process_folder("../src")
LCOV.writefile("lcov.info", coverage)
