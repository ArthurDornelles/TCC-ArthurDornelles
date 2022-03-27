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

function transform_matrix_plotable(M)
    """
    Transform a Matrix from operation form to a plotable one.
    """
    N = size(M)[1]
    M_list = transpose(reduce(hcat,[[M[x][y] for x in 1:N] for y in 1:N]))
    return M_list
    
end

function read_matrix(file)
    f = open(file,"r")

    M = []
    for line in readlines(f)
        aux = [Int(parse(Float64,x)) for x in split(line," ")]
        push!(M,aux)
    end
    close(f)
    return M
end

function size_matrix(M)
    N = Int(sqrt(length(M[1]))÷1)
    return N
end

function size_unidim_matrix(M)
    N = Int(sqrt(length(M))÷1)
    return N
end

function matrix_collection(t)

    anim = @animate for file in 1:t
        heatmap(transform_matrix_plotable(read_matrix(string("data/iterations/iteration",file,".txt"))),
                title = string("t = ",file))
    end
    return anim
end

function flux_from_file_to_collection(t,P)
    J = []
    for file in 1:t
        append!(J,get_flux_from_file(file,P))
    end
    return J
end

function flux_from_file_to_anim(t,P)
    J = []
    x_axis = []
    anim = @animate for file in 1:t
        append!(J,get_flux_from_file(file,P))
        append!(x_axis,file)
        plot(x_axis,J,title = string("t = ",file), xlims = (0,t), ylims = (-0.1,0.1))
    end
    return anim
end

function save_gif(anim,frame_rate,name)
    gif(anim,string("output/",name,"_fps",frame_rate,".gif"),fps=frame_rate)
end
