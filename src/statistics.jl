include("operations.jl")

function iteration_flux(M, M_old, S)
    N_changes = calculate_flux(M, M_old)
    J = N_changes / S
    return J
end

function calculate_flux(M, M_old)
    before = count_population_by_side(M_old)
    after = count_population_by_side(M)
    N_changes = (after[2] - before[2])
    return N_changes
end

function count_population_by_side(M)
    N = size_unidim_matrix(M)
    left = 0
    right = 0
    for i in 1:N^2
        x, y = array_to_coordinates(N, i)
        if (M[i] == 1 && x <= N / 2)
            left += 1

        elseif (M[i] == 1 && x > N / 2)
            right += 1
        end
    end
    return [left, right]
end

function relaxion_time(flux_list)
    last_zero = 0
    count = 0
    for item in flux_list
        count += 1
        if item != 0
            last_zero = count
        end
    end
    return last_zero + 1
end
