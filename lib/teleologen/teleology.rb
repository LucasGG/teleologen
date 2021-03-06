# frozen_string_literal: true

class Teleologen
  # Fitness function.
  class Teleology
    attr_reader :function

    # Creates a new +teleology+.
    def initialize(&function)
      @function = function
    end

    # Apply teleology.
    def calculate(behavior)
      @function.call(behavior).to_f
    end
  end
end
