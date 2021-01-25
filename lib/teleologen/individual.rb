# frozen_string_literal: true

class Teleologen
  # Represents a single instance of the population.
  class Individual
    attr_reader :genotype, :behavior

    # TODO
    attr_reader :phenotype

    # Creates a new +individual+.
    def initialize(*genotype, &behavior)
      @genotype = genotype
      @behavior = behavior
    end

    # Call behavior.
    def call
      @behavior.call(@genotype)
    end

    # Return genome.
    def genome
      @genotype.map(&:string).join
    end
  end
end
