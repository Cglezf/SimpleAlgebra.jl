"""
    module SimpleAlgebra

Módulo principal del paquete `SimpleAlgebra`.

Este módulo proporciona estructuras y funciones aritméticas simples basadas en múltiples dispatch.
Su enfoque principal es demostrar buenas prácticas en Julia utilizando tipos paramétricos, promoción de tipos, comparaciones personalizadas, documentación clara y pruebas automatizadas.

Actualmente incluye el submódulo:
- `Arithmetic`: define `ScalarOp` y operaciones elementales sobre estructuras escalares.

Exporta:
- `ScalarOp`, `add`, `sub`, `mul`, `div_safe`
"""

module SimpleAlgebra
using Logging
global_logger(ConsoleLogger(stderr, Logging.Info))

include("Arithmetic.jl")
using .Arithmetic

export ScalarOp, add, sub, mul, div_safe

end # modulo
