module ArithmeticTest

using Test
using SimpleAlgebra

"""
    test_arithmetic()

Conjunto mínimo de pruebas para cubrir `add(::ScalarOp, ::ScalarOp)` en `SimpleAlgebra`.
"""
function test_arithmetic()
    @testset "Suma" begin
        @test add(ScalarOp(1, 2), ScalarOp(3, 4)) == ScalarOp(4, 6)
        @test add(ScalarOp(1.0, 2.0), ScalarOp(0.5, 0.5)) == ScalarOp(1.5, 2.5)
        @test add(ScalarOp(1//2, 2//3), ScalarOp(1//2, 1//3)) == ScalarOp(1//1, 1//1)
    end

    @testset "Otras operaciones" begin
        @test sub(ScalarOp(3.5, 5.0), ScalarOp(1.5, 2.0)) == ScalarOp(2.0, 3.0)
        @test_throws DivideError div_safe(ScalarOp(1.0, 2.0), ScalarOp(0.0, 1.0))
    end

    @testset "Otras validaciones" begin
        result = add(ScalarOp(0.1, 0.2), ScalarOp(0.0, 0.0))
        @test isapprox(result.x + result.y, 0.3; atol=1e-10)
        @test_throws MethodError add(1 + 2im, 3 + 4im)
        @test_throws MethodError add(1, 2, 3)
    end

    @testset "Constructor un argumento" begin
        @test ScalarOp(3) == ScalarOp(3, 0)
        @test ScalarOp(3.5) == ScalarOp(3.5, 0.0)
        @test ScalarOp(2//5) == ScalarOp(2//5, 0//1)
    end

    @testset "Constructor con promoción de tipos" begin
        a = ScalarOp(3, 2.5)
        @test a isa ScalarOp{Float64}
        @test a.x == 3.0
        @test a.y == 2.5
    end

    @testset "Validación de inferencia" begin
        @test @inferred add(ScalarOp(1, 2), ScalarOp(3, 4)) == ScalarOp(4, 6)
        @test @inferred sub(ScalarOp(3.5, 5.0), ScalarOp(1.5, 2.0)) == ScalarOp(2.0, 3.0)
        @test @inferred mul(ScalarOp(2, 3), ScalarOp(1, 2)) == ScalarOp(2, 6)
        @test @inferred div_safe(ScalarOp(4.0, 9.0), ScalarOp(2.0, 3.0)) ==
            ScalarOp(2.0, 3.0)
    end

    @testset "Validación de comparaciones" begin
        @test ScalarOp(1, 2) == ScalarOp(1, 2)
        @test ScalarOp(1.0, 2.0) == ScalarOp(1.0, 2.0)
        @test ScalarOp(1//2, 2//3) == ScalarOp(2//4, 4//6)
        @test ScalarOp(1.0000000001, 2.0) != ScalarOp(1.0, 2.0)
        @test isapprox(ScalarOp(0.1 + 1e-10, 0.2), ScalarOp(0.1, 0.2); atol=1e-9)
    end

    @testset "Futuras extensiones" begin
        @test_broken add(ScalarOp(1, 2), 5.0)
    end
end

export test_arithmetic

end # module
