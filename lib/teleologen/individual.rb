# frozen_string_literal: true

class Teleologen
  # Represents a single instance of the population.
  class Individual
    attr_reader :phenotype, :behavior, :genotype

    # Creates a new +individual+.
    def initialize(*phenotype, &behavior)
      self.phenotype = phenotype
      @behavior = behavior
    end

    # Call behavior.
    def call
      @behavior.call(*@phenotype)
    end

    # Return genome.
    def genome
      @genome ||= @genotype.map(&:string).join
    end

    # Set phenotype and regenerate genotype.
    def phenotype=(phenotype)
      @phenotype = phenotype
      @genotype = @phenotype.map(&:to_chromosome)
    end
  end
end
