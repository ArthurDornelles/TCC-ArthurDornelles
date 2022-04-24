module ConfigParameters

export size_of_map, tax_rate, population_ratio, iterations, max_tax_rate

const size_of_map = 500
const tax_rate = 0.0
const population_ratio = 0.2
const iterations = 200
const max_tax_rate = 0.4
end

module SamplingParameters

export list_size_of_map, list_tax_rate, list_population_ratio, iterations

const list_size_of_map = [500]
const list_tax_rate = [0.10, 0.15, 0.20]
const list_population_ratio = [0.1, 0.2, 0.3, 0.4, 0.5]
const iterations = 500
end