# frozen_string_literal: true

class Teleologen
  # Reproduction between individuals.
  class Reproduction
    # Creates a new +reproduction+ model from a initial population of +individual+s.
    def initialize(population)
      @mating_pool = population
    end

    # Generate a new population of +individual+ reproducing the initial population.
    def reproduce(n, teleology: nil, mutation_ratio: 0.001)
      roullete = Roullete.new(@mating_pool, teleology)

      Array.new(n) do
        Mutation.new(
          CrossOver.new(roullete.roll, roullete.roll).child,
          ratio: mutation_ratio
        ).child
      end
    end
  end
end
