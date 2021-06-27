# frozen_string_literal: true

class Teleologen
  # Apply mutation to chromosome.
  class Mutation
    prepend Mixins::RandomOperators

    # Creates a new +mutation+ model for +individual+.
    def initialize(individual, ratio: 0.001)
      @individual = individual
      @ratio = ratio
    end
  end
end

require_relative 'strategies/mutation/default_mutation'
require_relative 'strategies/mutation/goldberg_cap3_mutation'
