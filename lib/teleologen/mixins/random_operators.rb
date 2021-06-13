# frozen_string_literal: true

class Teleologen
  module Mixins
    # Canonical operators from Goldberg's book.
    module RandomOperators
      # Returns Teleologen#rand.
      def rand(...)
        Teleologen.rand(...)
      end

      # Returns a boolean true value with specified probability.
      def flip(probability)
        Teleologen.rand <= probability
      end
    end
  end
end
