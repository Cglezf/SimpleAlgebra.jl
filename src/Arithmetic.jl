module Arithmetic
export ScalarOp, add, sub, mul, div_safe

struct ScalarOp{T<:Real}
    x::T
    y::T
end # ScalarOp Struct

function add(op::ScalarOp)
    @debug "Adding values: $(op.x) and $(op.y)"
    return op.x + op.y
end

function sub(op::ScalarOp)
    @debug "Subtracting values: $(op.y) from $(op.x)"
    return op.x - op.y
end

function mul(op::ScalarOp)
    @debug "Multiplying values: $(op.x) and $(op.y)"
    return op.x * op.y
end

function div_safe(op::ScalarOp)
    if iszero(op.y)
        @warn "Division by zero: $(op.x) by $(op.y)"
        throw(DivideError())
    end
    @debug "Dividing values: $(op.x) by $(op.y)"
    return op.x / op.y
end

end # module
