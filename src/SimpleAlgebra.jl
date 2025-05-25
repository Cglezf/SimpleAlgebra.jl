module SimpleAlgebra
export add, sub, mul, div_safe

function add(a::T, b::T)::T where {T<:Real}
    @info "Adding $a and $b"
    return a + b
end

function sub(a::T, b::T)::T where {T<:Real}
    @info "Subtracting $b from $a"
    return a - b
end

function mul(a::T, b::T)::T where {T<:Real}
    @info "Multiplying $a and $b"
    return a * b
end

function div_safe(a::T, b::T)::T where {T<:Real}
    @info "Dividing $a by $b"
    if iszero(b)
        throw(DivideError())
    end
    return a / b
end

end # modulo
