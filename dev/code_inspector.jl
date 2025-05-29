module CodeInspector
using InteractiveUtils: @code_typed, @code_warntype

export inspect_code

"""
    inspect_code(f, args...; label="", typed=true, warntype=true)

Imprime un diagnóstico de código usando `@code_warntype` y `@code_typed` para una función `f` con los argumentos `args...`.

# Argumentos
- `f`: función a inspeccionar.
- `args...`: argumentos que se le pasarán a `f`.
- `label`: texto opcional que identifica el caso.
- `typed`: si es `true`, incluye `@code_typed`.
- `warntype`: si es `true`, incluye `@code_warntype`.

# Ejemplo
'''julia
    inspect_code(add, ScalarOp(1, 2), ScalarOp(3, 4), label="Suma de enteros")
    ```

Ideal para diagnóstico y detección de `Any` o tipado dinámico.
"""

function inspect_code(f, args...; label="", typed=true, warntype=true)
    println("\n", label != "" ? "🔍 $label" : "🔍 Inspección sin etiqueta")

    if typed
        println("\n▶️  @code_typed:")
        display(@code_typed f(args...))
    end

    if warntype
        println("\n⚠️  @code_warntype:")
        @code_warntype f(args...)
    end
end

end # MOD CodeInspector
