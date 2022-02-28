include("src/functions.jl")

size_of_map = 1000
tax_rate = 0.15
population_ratio = 0.40
iterations = 100

M = define_area(size_of_map)
M = set_taxes_in_matrix(M,tax_rate)
M = set_initial_population(M,population_ratio)
P = size_of_map^2*population_ratio

println("-------Starting Iterations-------")

for n in 1:iterations
    global M
    log_iteration(n,iterations)
    M = make_iteration(M)
    print_matrix(M,n)
end

println("-------Animating Gif-------")
anim = matrix_collection(100)
println("-------Saving GIF-------")
save_gif(anim,5,"MatrixAnim")

println("-------Calculating Flux-------")
flux_anim = flux_collection(100,P)
println("-------Saving GIF-------")
save_gif(flux_anim,5,"FluxAnim")

println("-------FINISHED-------")

