include("src/functions.jl")
include("config.jl")

using .ConfigParameters

P = size_of_map^2*population_ratio

println("-------Animating Gif-------")
anim = matrix_collection(iterations)
println("-------Saving GIF-------")
save_gif(anim,5,"MatrixAnim")

println("-------Calculating Flux-------")
flux_anim = flux_from_file_to_anim(iterations,P)
println("-------Saving GIF-------")
save_gif(flux_anim,5,"FluxAnim")

println("-------FINISHED-------")