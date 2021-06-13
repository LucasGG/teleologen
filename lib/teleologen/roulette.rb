# frozen_string_literal: true

class Teleologen
  # This class represents the roullete implementation for genetic algorithm.
  #
  # Roulletes serves to return infinite individuals with a probability proportional to their fitness.
  class Roulette
    prepend Mixins::RandomOperators

    # Creates a new roullete for a +population+ and +teleology+.
    def initialize(population, teleology)
      @population = population
      @teleology = teleology
    end
  end
end

require_relative 'strategies/roulette/default_roulette'
require_relative 'strategies/roulette/goldberg_cap3_roulette'
