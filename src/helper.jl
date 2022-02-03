using Colors, Plots

function rand_coordinates(N)
    """ """
    x = rand((1:N))
    y = rand((1:N))
    return x,y
end

function coordinates_to_array(N,x,y)
    """ """
    x > N || y > N ? error("Coordinate beyond matrix. X = $x, Y = $y, N = $N") : ""

    i = (y-1)*(N)+x
    return i
end

function array_to_coordinates(N,i)
    """ """
    x = i % (N)
    y = ((i-1) ÷ N) +1
    if x == 0
        x = N
    end
    return x, y
end

function size_matrix(M)
    N = Int(sqrt(length(M[1]))÷1)
    return N
end

function print_matrix(M,n_i)
    n = 0
    N = size_matrix(M)
    fname = string("data/iteration",string(n_i),".txt")
    open(fname,"w+") do f
        for i in 1:N^2
            write(f,string(M[1][i]))
            i % N == 0 ? write(f,"\n") : write(f," ")
        end
    end
end

function plot_matrix(M)
    heatmap(M, color = :greys)
end

function sec_half(N) return Int((N/2 ÷ 1) + 1) end