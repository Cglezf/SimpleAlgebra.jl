module Arithmetic

export ScalarOp, add, sub, mul, div_safe

"""
    ScalarOp(x::T, y::T) where T<:Real

Representa una operación escalar sobre dos valores del mismo tipo.
Los valores son promovidos automáticamente si los tipos no coinciden.
"""
struct ScalarOp{T<:Real}
    x::T
    y::T
end

"""
    ScalarOp(x::Real, y::Real)

Constructor personalizado que promueve los valores a un tipo común.
Esto permite escribir `ScalarOp(3.5, 2)` sin errores de tipo.
"""
function ScalarOp(x::Real, y::Real)
    T = promote_type(typeof(x), typeof(y))
    return ScalarOp{T}(promote(x, y)...)
end

"""
    ScalarOp(x::Real)

Constructor adicional para `ScalarOp` que asume `y = 0`.
Útil para representar un escalar como operación unaria.
"""
function ScalarOp(x::Real)
    return ScalarOp(x, zero(x))
end

"""
    add(a::ScalarOp, b::ScalarOp)

Suma dos objetos `ScalarOp` componente a componente.
Promueve los tipos si es necesario.
"""
function add(a::ScalarOp, b::ScalarOp)
    T = promote_type(typeof(a.x), typeof(b.x))
    return ScalarOp{T}(promote(a.x + b.x, a.y + b.y)...)
end

"""
    sub(a::ScalarOp, b::ScalarOp)

Resta componente a componente entre dos `ScalarOp`.
"""
function sub(a::ScalarOp, b::ScalarOp)
    T = promote_type(typeof(a.x), typeof(b.x))
    return ScalarOp{T}(promote(a.x - b.x, a.y - b.y)...)
end

"""
    mul(a::ScalarOp, b::ScalarOp)

Multiplica componente a componente dos `ScalarOp`.
"""
function mul(a::ScalarOp, b::ScalarOp)
    T = promote_type(typeof(a.x), typeof(b.x))
    return ScalarOp{T}(promote(a.x * b.x, a.y * b.y)...)
end

"""
    div_safe(a::ScalarOp, b::ScalarOp)

Realiza una división segura componente a componente.
Lanza un error si alguno de los divisores es cero.
"""
function div_safe(a::ScalarOp, b::ScalarOp)
    if iszero(b.x) || iszero(b.y)
        @warn "Intento de dividir entre cero"
        throw(DivideError())
    end
    T = promote_type(typeof(a.x), typeof(b.x))
    return ScalarOp{T}(promote(a.x / b.x, a.y / b.y)...)
end

import Base: ==
"""
    ==(a::ScalarOp, b::ScalarOp) -> Bool

Compara dos `ScalarOp` por igualdad exacta componente a componente.
"""
==(a::ScalarOp, b::ScalarOp) = a.x == b.x && a.y == b.y

import Base: isapprox
"""
    isapprox(a::ScalarOp, b::ScalarOp; kwargs...) -> Bool

Compara dos `ScalarOp` usando `Base.isapprox` en cada componente.
Permite tolerancias configurables.
"""
function isapprox(a::ScalarOp, b::ScalarOp; kwargs...)
    return isapprox(a.x, b.x; kwargs...) && isapprox(a.y, b.y; kwargs...)
end

end # module
