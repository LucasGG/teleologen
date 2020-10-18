# frozen_string_literal: true

class Genetic
  # Fitness function.
  class Teleology
    attr_reader :function

    def initialize(&function)
      @function = function
    end

    def calculate(behavior)
      @function.call(behavior).to_f
    end
  end
end
