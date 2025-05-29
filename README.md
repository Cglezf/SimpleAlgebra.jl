# SimpleAlgebra

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://Cglezf.github.io/SimpleAlgebra.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://Cglezf.github.io/SimpleAlgebra.jl/dev/)
[![Build Status](https://github.com/Cglezf/SimpleAlgebra.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/Cglezf/SimpleAlgebra.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/Cglezf/SimpleAlgebra.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/Cglezf/SimpleAlgebra.jl)

SimpleAlgebra es un módulo de formación en Julia que introduce conceptos fundamentales del Julia Way, como el múltiple despacho, tipos definidos por el usuario (struct), y la composición de funciones algebraicas con buenas prácticas de desarrollo profesional.

⸻

## Instalación

pkg> add path/to/SimpleAlgebra

⸻

## Uso Básico

```{julia}
using SimpleAlgebra

x = ScalarOp(4.0)
y = ScalarOp(2.0)

add(x, y)      # ScalarOp(6.0)
sub(x, y)      # ScalarOp(2.0)
mul(x, y)      # ScalarOp(8.0)
div_safe(x, y) # ScalarOp(2.0)
```

## Estructura

```{julia}
struct ScalarOp
    value::Float64
end
```

ScalarOp es un tipo ligero que envuelve un escalar y permite realizar operaciones aritméticas mediante funciones separadas, con despacho basado en tipos.

⸻

## API

add(a::ScalarOp, b::ScalarOp) -> ScalarOp

Suma dos objetos ScalarOp y devuelve el resultado como ScalarOp.

sub(a::ScalarOp, b::ScalarOp) -> ScalarOp

Resta dos objetos ScalarOp. Resta b de a y devuelve el resultado como ScalarOp.

mul(a::ScalarOp, b::ScalarOp) -> ScalarOp

Multiplica dos ScalarOp y devuelve el resultado como ScalarOp.

div_safe(a::ScalarOp, b::ScalarOp) -> ScalarOp

Realiza una división segura. Si b es cero, lanza un DomainError.

⸻

## Filosofía Julia Way

 • Múltiple despacho: cada función está definida en términos de los tipos de sus argumentos.
 • Separación de datos y funciones: ScalarOp no tiene métodos adjuntos.
 • Evitar mutabilidad innecesaria: ScalarOp es inmutable.
 • No usar operadores sobrecargados aún: se usa add, sub, etc., para mantener claridad didáctica.

⸻

## Próximo paso: Tipos paramétricos

```{julia}
struct ScalarOp{T<:Number}
    value::T
end
```

Esto permitirá trabajar con Int, Float32, BigFloat, etc., de forma genérica.

⸻

## Contribución

Puedes abrir un Pull Request o sugerir mejoras mediante Issues. Este paquete forma parte del proyecto de formación en ciencia de datos con Julia.

⸻

## Licencia

MIT © 2025 Simon Gonzalez
