module SimpleAlgebra
using Logging
global_logger(ConsoleLogger(stderr, Logging.Info))

include("Arithmetic.jl")
using .Arithmetic

export ScalarOp, add, sub, mul, div_safe

end # modulo
