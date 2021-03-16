# frozen_string_literal: true

class Teleologen
  # This class represents the roullete implementation for genetic algorithm.
  #
  # Roulletes serves to return infinite individuals with a probability proportional to their fitness.
  class Roullete
    Slice = Struct.new(:individual, :fitness, :survivability)

    # Creates a new roullete for a +population+ and +teleology+.
    def initialize(population, teleology)
      @population = population
      @teleology = teleology
    end

    # Roll one individual.
    def roll(survivability: Teleologen.rand)
      population_total_fitness.zero? ? @population.sample : search_slice_by_survivability(survivability).individual
    end

    private

    # Search slice for the roulette based on survivability.
    def search_slice_by_survivability(survivability)
      population_slices.bsearch do |slice|
        individual_survivability = slice.survivability

        if individual_survivability.first > survivability
          -1
        elsif individual_survivability.last <= survivability
          1
        else
          0
        end
      end
    end

    # Fills the initial population details.
    def population_slices
      return @population_slices if @population_slices

      @population_slices = @population.map do |individual|
        Slice.new(individual, @teleology.calculate(individual.call))
      end

      # Populate survivabilities.
      @population_slices.reduce(0) do |head, slice|
        (slice.survivability = head...(head + slice.fitness / population_total_fitness)).last
      end

      @population_slices
    end

    # Calculate and return population total fitness.
    def population_total_fitness
      @population_total_fitness ||= population_slices.sum(&:fitness)
    end
  end
end
