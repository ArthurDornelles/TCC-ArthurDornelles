module ConfigParameters

export size_of_map, tax_rate, population_ratio, iterations, max_tax_rate

const size_of_map = 800
const tax_rate = 0.075
const population_ratio = 0.4
const iterations = 300
const max_tax_rate = 0.075
end

module SamplingParameters

export list_size_of_map, list_tax_rate, list_population_ratio, iterations

const list_size_of_map = [100, 500, 1000, 3000]
const list_tax_rate = [0.05, 0.10, 0.15, 0.20]
const list_population_ratio = [0.1, 0.2, 0.3, 0.4, 0.5]
const iterations = 200
end