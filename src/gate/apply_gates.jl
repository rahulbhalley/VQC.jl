


function _apply_gate_impl(key::Int, m::AbstractArray, qstate::Vector)
	fsize = 2^(key-1)
	bsize = div(length(qstate), 2*fsize)
	s = reshape(qstate, (fsize, size(m, 2), bsize))
	inplace_apply!(s, m)
end

function _apply_gate_impl(key::Tuple{Int, Int}, op::AbstractArray, qstate::Vector)
	i, j = key
	swap!(qstate, i, j-1)
	fsize = 2^(j-2)
	m = reshape(op, (4,4))
	bsize = div(length(qstate), (fsize*4))
	s = reshape(qstate, (fsize, size(m, 2), bsize))
	inplace_apply!(s, m)
	swap!(qstate, i, j-1)

end

function _apply_gate_impl(key::Tuple{Int, Int, Int}, op::AbstractArray, qstate::Vector)
	i, j, k = key
	swap!(qstate, i, j-1)
	swap!(qstate, k, j+1)
	fsize = 2^(j-2)
	m = reshape(op, (8,8))
	bsize = div(length(qstate), (fsize*8))
	s = reshape(qstate, (fsize, size(m, 2), bsize))
	inplace_apply!(s, m)
	swap!(qstate, j-1, i)
	swap!(qstate, j+1, k)
end

apply_gate!(x::AbstractGate, s::Vector) = _apply_gate_impl(key(x), op(x), s)