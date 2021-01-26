# frozen_string_literal: true

class Teleologen
  # Apply mutation to chromosome.
  class Mutation
    # Creates a new +mutation+ model for +individual+.
    def initialize(individual, ratio: 0.001)
      @individual = individual
      @ratio = ratio
    end

    # Generates a child.
    def child
      chromosomes = @individual.genotype.map do |chromosome|
        Chromosome.new(chromosome.alleles.map { |allele| mutate(allele) }.join, klass: chromosome.klass)
      end

      behavior = @individual.behavior

      Individual.new(*chromosomes.map(&:to_parameter), &behavior)
    end

    private

    # Simple mutation, 0 to 1 or 1 to 0 with a @ratio chance.
    def mutate(allele)
      if rand < @ratio
        allele == '0' ? '1' : '0'
      else
        allele
      end
    end
  end
end
