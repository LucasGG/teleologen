# frozen_string_literal: true

class Genetic
  ##
  # Apply mutation to chromosome.

  class Mutation
    def initialize(individual, ratio: 0.001)
      @individual = individual
      @ratio = ratio
    end

    ##
    # Generates a child.

    def child
      chromosomes = @individual.genotype.map do |chromosome|
        Chromosome.new(
          chromosome.alleles.map do |allele|
            if rand < @ratio
              allele == '0' ? '1' : '0'
            else
              allele
            end
          end.join,
          klass: chromosome.klass
        )
      end

      Individual.new(*chromosomes, &@individual.behavior)
    end
  end
end
