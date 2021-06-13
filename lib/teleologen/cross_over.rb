# frozen_string_literal: true

class Teleologen
  # Apply cross over to chromosome reproduction.
  class CrossOver
    prepend Mixins::RandomOperators

    # Creates a new +cross_over+ model.
    def initialize(first_invidual, second_individual)
      @first_invidual = first_invidual
      @second_individual = second_individual
    end
  end
end

require_relative 'strategies/cross_over/default_cross_over'
require_relative 'strategies/cross_over/goldberg_cap3_cross_over'
