# SimpleAlgebra

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://Cglezf.github.io/SimpleAlgebra.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://Cglezf.github.io/SimpleAlgebra.jl/dev/)
[![Build Status](https://github.com/Cglezf/SimpleAlgebra.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/Cglezf/SimpleAlgebra.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/Cglezf/SimpleAlgebra.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/Cglezf/SimpleAlgebra.jl)

---

SimpleAlgebra.jl es una biblioteca minimalista en Julia para realizar operaciones aritméticas básicas sobre estructuras escalares definidas por el usuario. Utiliza múltiples dispatch, tipos paramétricos y validación segura, respetando el estilo idiomático de Julia.

---

# Instalación

pkg> add path/to/SimpleAlgebra

---

# Uso Básico

```julia
using SimpleAlgebra

x = ScalarOp(4.0)
y = ScalarOp(2.0)

add(x, y)      # ScalarOp(6.0)
sub(x, y)      # ScalarOp(2.0)
mul(x, y)      # ScalarOp(8.0)
div_safe(x, y) # ScalarOp(2.0)
```

---

# API

```julia
struct ScalarOp{T<:Real}
    x::T
    y::T
end
```

• add(a::ScalarOp, b::ScalarOp) → suma componente a componente
• sub(a::ScalarOp, b::ScalarOp) → resta segura
• mul(a::ScalarOp, b::ScalarOp) → multiplicación
• div_safe(a::ScalarOp, b::ScalarOp) → división segura con validación de cero
• ==(a::ScalarOp, b::ScalarOp) → comparación exacta
• isapprox(a::ScalarOp, b::ScalarOp) → comparación aproximada

---

# Principios del diseño

• Múltiple despacho: operaciones diferenciadas por tipos.
• Separación de datos y funciones: el tipo no contiene lógica.
• Inmutabilidad: ScalarOp es inmutable por defecto.
• Desacoplamiento de operadores: no se sobrecargan +, -, *, / en esta versión para mantener claridad.

---

# Contribución

Este paquete es abierto a mejoras, sugerencias y nuevas funciones. Puedes abrir un Pull Request o reportar un Issue.

---

# Licencia

MIT © 2025 Simon Gonzalez
