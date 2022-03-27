using Colors, Plots

function rand_coordinates(N)
    """ """
    x = rand((1:N))
    y = rand((1:N))
    return x, y
end

function print_matrix(M, n_i)
    n = 0
    N = size_matrix(M)
    fname = string("data/iterations/iteration", string(n_i), ".txt")
    open(fname, "w+") do f
        for i in 1:N^2
            write(f, string(M[1][i]))
            i % N == 0 ? write(f, "\n") : write(f, " ")
        end
    end
end

function print_flux(J, N, tax, P, iterations)
    header = string("_N-", string(N), "_tax-", string(trunc(Int, tax * 100)), "_P-", string(trunc(Int, P * 100)))
    fname = string("data/statistics/flux", header, ".txt")
    println("-----Started Flux Loading-----")
    open(fname, "w+") do f
        for i in 1:iterations
            write(f, string(J[i]))
            write(f, "\n")
        end
    end
end

function plot_matrix(M)
    heatmap(M, color=:greys)
end

function log_iteration(n, n_total)
    if (n == n_total ÷ 4)
        println("------------25% Complete-----------")
    end
    if (n == n_total ÷ 2)
        println("------------50% Complete-----------")
    end
    if (n == 3 * n_total ÷ 4)
        println("------------75% Complete-----------")
    end
    if (n == n_total)
        println("-----------100% Complete-----------")
    end
end

function sec_half(N)
    return Int((N / 2 ÷ 1) + 1)
end