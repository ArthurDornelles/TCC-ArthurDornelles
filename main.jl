include("src/functions.jl")

size_of_map = 100
tax_rate = 0.15
population_ratio = 0.40
iterations = 100

M = define_area(size_of_map)
M = set_taxes_in_matrix(M,tax_rate)
M = set_initial_population(M,population_ratio)
P = size_of_map^2*population_ratio

for n in 1:iterations
    
    global M
    M = make_iteration(M)
    print_matrix(M,n)
end

anim = matrix_collection(100)
save_gif(anim,5)
