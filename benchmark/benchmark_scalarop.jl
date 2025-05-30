using SimpleAlgebra
using BenchmarkTools

println("Benchmark constructures y suma con ScalarOp")

a_int = ScalarOp(1, 2)
b_int = ScalarOp(3, 4)
a_float = ScalarOp(1.0, 2.0)
b_float = ScalarOp(3.0, 4.0)
a_rational = ScalarOp(1//2, 2//3)
b_rational = ScalarOp(1//2, 1//3)

println("\nConstructores:")
println("Constructor con enteros:")
@btime ScalarOp(1, 2)
println("Constructor con flotantes:")
@btime ScalarOp(1.0, 2.0)
println("Constructor con racionales:")
@btime ScalarOp(1//2, 2//3)
println("\nSumas:")
println("Suma con enteros:")
@btime add($a_int, $b_int)
println("Suma con flotantes:")
@btime add($a_float, $b_float)
println("Suma con racionales:")
@btime add($a_rational, $b_rational)
