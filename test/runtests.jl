push!(LOAD_PATH, "../src")
using Test




@testset "test quantum algorithm" begin
    include("algs.jl")
end

@testset "test circuit parameters" begin
    include("parameter.jl")
end


@testset "test quantum circuit gradient" begin
    include("circuitgrad.jl")
    include("circuit2dgrad.jl")
    include("crxgategrad.jl")
end

@testset "test quantum state gradient (may not variable via a quantum computer)" begin
    include("stategrad.jl")
end

@testset "test control hamiltonian gradient" begin
    include("ctrlhamgrad.jl")
end

@testset "test Chain gradient" begin
    include("chaingrad.jl")
end

@testset "test measure and select" begin
    include("check_measure.jl")
end