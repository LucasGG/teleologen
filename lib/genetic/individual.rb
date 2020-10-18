# frozen_string_literal: true

class Genetic
  class Individual
    attr_reader :genotype
    attr_reader :behavior

    def initialize(*genotype, &behavior)
      @genotype = genotype
      @behavior = behavior
    end

    ##
    # Call behavior.

    def call
      @behavior.call(@genotype)
    end

    ##
    # Return genome.

    def genome
      @genotype.map(&:string).join
    end
  end
end
