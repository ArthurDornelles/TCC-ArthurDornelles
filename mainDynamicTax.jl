include("src/functions.jl")
include("config.jl")

using .ConfigParameters
const iterations = 100


M = define_area(size_of_map)
M = set_taxes_in_matrix(M, tax_rate)
M = set_initial_population(M, population_ratio)
P = size_of_map^2 * population_ratio

println("-------Starting Iterations-------")

for n in 1:iterations
    global M
    log_iteration(n, iterations)
    M = make_iteration(M, true, max_tax_rate)[1]
    print_matrix(M, n)
end
