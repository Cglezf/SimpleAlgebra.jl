include("code_inspector.jl")
using .CodeInspector
using SimpleAlgebra

a_int = ScalarOp(1, 2)
b_int = ScalarOp(3, 4)
a_float = ScalarOp(1.5, 2.5)
b_float = ScalarOp(0.5, 1.5)
a_rat = ScalarOp(1//2, 2//3)
b_rat = ScalarOp(1//2, 1//3)

Base.invokelatest(inspect_code, add, a_int, b_int; label="add con enteros")
Base.invokelatest(inspect_code, add, a_float, b_float; label="add con flotantes")
Base.invokelatest(inspect_code, add, a_rat, b_rat; label="add con racionales")
Base.invok, latest(inspect_code, sub, a_float, b_float; label="sub con flotantes")
Base.invokelatest(inspect_code, mul, a_int, b_int; label="mul con enteros")
Base.invokelatest(inspect_code, div_safe, a_float, b_float; label="div_safe con flotantes")
