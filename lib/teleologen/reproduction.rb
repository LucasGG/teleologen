# frozen_string_literal: true

class Teleologen
  # Reproduction between individuals.
  class Reproduction
    # Creates a new +reproduction+ model from a initial population of +individual+s.
    def initialize(population,
                   roulette: DefaultRoulette,
                   cross_over: DefaultCrossOver,
                   mutation: DefaultMutation)
      @mating_pool = population
      @roulette = roulette
      @cross_over = cross_over
      @mutation = mutation
    end

    # Generate a new population of +individual+ reproducing the initial population.
    def reproduce(size, teleology: nil, mutation_ratio: 0.001)
      roullete = @roulette.new(@mating_pool, teleology)

      Array.new(size) do
        @mutation.new(
          @cross_over.new(roullete.roll, roullete.roll).apply,
          ratio: mutation_ratio
        ).apply
      end
    end
  end
end
