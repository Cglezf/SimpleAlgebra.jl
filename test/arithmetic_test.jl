using Test
using SimpleAlgebra

@testset "ArimethmeticTest" begin
    s = ScalarOp(6, 3)
    @test add(s) == 9
    @test sub(s) == 3
    @test mul(s) == 18
    @test div_safe(s) == 2.0
    @test_throws DivideError div_safe(ScalarOp(6, 0))
    @test_throws MethodError add(ScalarOp(1, 2), ScalarOp(3, 4))
end
