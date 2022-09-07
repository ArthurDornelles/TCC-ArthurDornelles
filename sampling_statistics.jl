include("src/operations.jl")


transform_matrix_plotable(read_matrix(string("data/statistics/flux_N-", N, "_tax-", tax, "_P-", P, ".txt")))

function read_file(file)
    f = open(file, "r")
    items = []
    for line in readlines(f)
        push!(items, [split(line," "), ])
    end
end
