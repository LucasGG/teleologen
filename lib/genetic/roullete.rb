# frozen_string_literal: true

class Genetic
  ##
  # This class represents the roullete implementation for genetic algorithm.
  #
  # Roulletes serves to return infinite individuals with a probability proportional to their fitness.

  class Roullete
    ##
    # Creates a new roullete for a +population+ and +teleology+.

    def initialize(population, teleology)
      @population = population
      @teleology = teleology
    end

    ##
    # Roll one individual.

    def roll(n: rand)
      @ranges ||= ranges
      @ranges.find { |range| range[1][:survivability].cover?(n) }&.first || @ranges.sample.first
    end

    private

    # Calculate population ranges for pool.
    def ranges
      correlations = @population.to_h { |individual| [individual, { fitness: fitness(individual) }] }

      total_fitness = correlations.sum { |*, info| info[:fitness] }

      correlations.each.with_object(pivot: 0.0).map do |correlation, actual_range|
        generate_range(correlation[1], actual_range, total_fitness)
        correlation
      end
    end

    def generate_range(info, survivability, total_fitness)
      fitness = info[:fitness]
      pivot = survivability[:pivot]
      survivability_range = total_fitness.zero? ? 0.0...0.0 : pivot...(pivot + fitness / total_fitness.to_f)
      info[:survivability] = survivability_range
      survivability[:pivot] = survivability_range.last
    end

    def fitness(individual)
      @teleology.calculate(individual.call)
    end
  end
end
