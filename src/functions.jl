include("helper.jl")

function define_area(N)
    """ """
    M = [[],[]]
    M[1] = zeros(N^2)
    M[2] = zeros(N^2)
    return M
end

function allocate_tax(M)
    test = true
    N = size_matrix(M)
    while test
        x, y = rand_coordinates(N)
        i = coordinates_to_array(N,x,y)
        if x > N/2 || M[1][i] != 0
            continue
        else
            M[1][i] = 2
            test = false
        end    
    end
    return M
end

function allocate_person(M,region,k)
    N = size_matrix(M)
    test = true
    while test
        x,y = rand_coordinates(N)
        i = coordinates_to_array(N,x,y)
        if region == "left"
            if x > N/2 || M[k][i] != 0
                continue
            end
            M[k][i] = 1
            test = false
        else
            if x <= N/2 || M[k][i] != 0
                continue
            end
            M[k][i] = 1
            test = false
        end
    end
    return M
end

function set_taxes_in_matrix(M,tax_rate)
    """ """
    tax_rate > 0.5 || tax_rate < 0 ? error("tax is too big") : ""
    N_2 = length(M[1])
    n_taxes = Int((N_2*tax_rate)÷1)
    for _ in 1:n_taxes
        M = allocate_tax(M)
    end
    M[2] = M[1][:]
    return M
end

function set_initial_population(M,population_ratio)
    """ """
    population_size = length(M[1])*population_ratio ÷ 1
    for n in 1:population_size
        if n <= population_size/2
            M = allocate_person(M,"left",1)
        else
            M = allocate_person(M,"right",1)
        end
    end
    return M
end

function check_neighbors(M,x,y)
    """ """
    N = size_matrix(M)
    N_h = sec_half(N)
    i = coordinates_to_array(N,x,y)
    sum = 0
    if (x == 1 || x == N_h)

        if (y == 1)
            M[1][i+1] != 2 ? sum += M[1][i+1] : ""
            M[1][i+N] != 2 ? sum += M[1][i+N] : ""
            M[1][i+N+1] != 2 ? sum += M[1][i+N] : ""
        elseif (y == N)
            M[1][i-N] != 2 ? sum += M[1][i-N] : ""
            M[1][i-N+1] != 2 ? sum += M[1][i-N+1] : ""
            M[1][i+1] != 2 ? sum += M[1][i-N+1] : ""
        else
            M[1][i-N] != 2 ? sum += M[1][i-N] : ""
            M[1][i-N+1] != 2 ? sum += M[1][i-N+1] : ""
            M[1][i+1] != 2 ? sum += M[1][i+1] : ""
            M[1][i+N] != 2 ? sum += M[1][i+N] : ""
            M[1][i+N+1] != 2 ? sum += M[1][i+N+1] : ""
        end
        
    elseif (x == N || x == N_h - 1)
        
        if (y == 1)
            M[1][i-1] != 2 ? sum += M[1][i-1] : ""
            M[1][i+N-1] != 2 ? sum += M[1][i+N-1] : ""
            M[1][i+N] != 2 ? sum += M[1][i+N] : ""
            
        elseif (y == N)
            M[1][i-N-1] != 2 ? sum += M[1][i-N-1] : ""
            M[1][i-N] != 2 ? sum += M[1][i-N] : ""
            M[1][i-1] != 2 ? sum += M[1][i-1] : ""
            
        else
            M[1][i-N-1] != 2 ? sum += M[1][i-N-1] : ""
            M[1][i-N] != 2 ? sum += M[1][i-N] : ""
            M[1][i-1] != 2 ? sum += M[1][i-1] : ""
            M[1][i+N-1] != 2 ? sum += M[1][i+N-1] : ""
            M[1][i+N] != 2 ? sum += M[1][i+N] : ""
            
        end
        
    elseif (y == 1)  
        M[1][i-1] != 2 ? sum += M[1][i-1] : ""
        M[1][i+1] != 2 ? sum += M[1][i+1] : ""
        M[1][i+N-1] != 2 ? sum += M[1][i+N-1] : ""
        M[1][i+N] != 2 ? sum += M[1][i+N] : ""
        M[1][i+N+1] != 2 ? sum += M[1][i+N+1] : ""
        
    elseif (y == N)  
        M[1][i-N-1] != 2 ? sum += M[1][i-N-1] : ""
        M[1][i-N] != 2 ? sum += M[1][i-N] : ""
        M[1][i-N+1] != 2 ? sum += M[1][i-N+1] : ""
        M[1][i-1] != 2 ? sum += M[1][i-1] : ""
        M[1][i+1] != 2 ? sum += M[1][i+1] : ""
        
    else
        M[1][i-N-1] != 2 ? sum += M[1][i-N-1] : ""
        M[1][i-N] != 2 ? sum += M[1][i-N] : ""
        M[1][i-N+1] != 2 ? sum += M[1][i-N+1] : ""
        M[1][i-1] != 2 ? sum += M[1][i-1] : ""
        M[1][i+1] != 2 ? sum += M[1][i+1] : ""
        M[1][i+N-1] != 2 ? sum += M[1][i+N-1] : ""
        M[1][i+N] != 2 ? sum += M[1][i+N] : ""
        M[1][i+N+1] != 2 ? sum += M[1][i+N+1] : ""
        
    end
    return sum

end

function move_person(M,x,y)
    N = size_matrix(M)
    i = coordinates_to_array(N,x,y)
    check = true
    while check
        x_new,y_new = rand_coordinates(N)
        i_new = coordinates_to_array(N,x_new,y_new)
        
        (x_new == x && y_new == y) ? continue : ""

        if M[2][i_new] == 0
            M[2][i_new] = 1
            check = false
        end  
    end
    M[2][i] = 0
    return M
end

function make_iteration(M)
    N = size_matrix(M)
    M[2] = M[1][:]
    for i in 1:N^2
        M[1][i] == 2 ? continue : ""
        x,y = array_to_coordinates(N,i)
        if M[1][i] == 1
            sum = check_neighbors(M,x,y)
            if sum < 3
                M = move_person(M,x,y)
            end
        end
    end
    M[1] = M[2][:]
    return M
end