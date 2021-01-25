# frozen_string_literal: true

class Teleologen
  # Represents a single instance of the population.
  class Individual
    attr_accessor :phenotype, :behavior
    attr_reader :genotype

    # Creates a new +individual+.
    def initialize(*phenotype, &behavior)
      self.phenotype = phenotype
      self.behavior = behavior
    end

    # Call behavior.
    def call
      @behavior.call(@genotype)
    end

    # Return genome.
    def genome
      @genotype.map(&:string).join
    end

    def phenotype=(phenotype)
      @phenotype = phenotype
      @genotype = @phenotype.map(&:to_chromosome)
    end
  end
end
