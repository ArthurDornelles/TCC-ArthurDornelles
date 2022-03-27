include("src/functions.jl")
include("config.jl")

using .ConfigParameters
using .RunningParameters
const iterations = 100
for size_of_map_i in list_size_of_map
    println("----------------------------------")
    println("---------MAP SIZE ",size_of_map_i,"------------")
    for tax_rate_i in list_tax_rate
        println("---------TAX RATE ",tax_rate_i,"------------")
        
        for population_rate_i in list_population_ratio
            global iterations
            println("------POPULATION RATIO ",population_rate_i,"---------")


            println("-------Starting Iterations-------")

            function complete_iteration(iterations)
                M = define_area(size_of_map_i)
                M = set_taxes_in_matrix(M,tax_rate_i)
                M = set_initial_population(M,population_rate_i)
                for n in 1:iterations
                    log_iteration(n,iterations)
                    M = make_iteration(M)
                    print_matrix(M,n)
                end
            end

            complete_iteration(100)

            println("-----Starting Flux Calculation-----")

            J = (flux_from_file_to_collection(iterations, population_rate_i))
            print_flux(J,size_of_map_i,tax_rate_i,population_rate_i,iterations)

            println("----------- FINISHED -------------")
        end
    end
end