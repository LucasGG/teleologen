# frozen_string_literal: true

class Teleologen
  # This class represents the roullete implementation for genetic algorithm.
  #
  # Roulletes serves to return infinite individuals with a probability proportional to their fitness.
  class Roullete
    # Creates a new roullete for a +population+ and +teleology+.
    def initialize(population, teleology)
      @population = population
      @teleology = teleology
    end

    # Roll one individual.
    def roll(n: rand)
      survivabilities.find { |range| range[1][:survivability].cover?(n) }&.first || @population.sample
    end

    private

    # Calculate population survivabilities.
    def survivabilities
      return @survivabilities if @survivabilities

      total_fitness = correlations.sum { |*, info| info[:fitness] }

      @survivabilities = correlations.each.with_object(pivot: 0.0).map do |correlation, actual_range|
        generate_range(correlation[1], actual_range, total_fitness)
        correlation
      end
    end

    # Generate ranges for population roll.
    def generate_range(info, survivability, total_fitness)
      return if total_fitness.zero?

      fitness = info[:fitness]
      pivot = survivability[:pivot]
      survivability_range = pivot...(pivot + fitness / total_fitness)
      info[:survivability] = survivability_range
      survivability[:pivot] = survivability_range.last
    end

    # Get fitness to individual correlations.
    def correlations
      @correlations ||= @population.to_h do |individual|
        [individual, { fitness: @teleology.calculate(individual.call) }]
      end
    end
  end
end
