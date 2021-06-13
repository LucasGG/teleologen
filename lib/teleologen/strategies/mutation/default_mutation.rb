# frozen_string_literal: true

class Teleologen
  # Implementation of a Mutation.
  class DefaultMutation < Mutation
    # Return one individual.
    def apply
      chromosomes = @individual.genotype.map do |chromosome|
        Chromosome.new(chromosome.alleles.map { |allele| mutate(allele) }.join, klass: chromosome.klass)
      end

      behavior = @individual.behavior

      Individual.new(*chromosomes.map(&:to_parameter), &behavior)
    end

    private

    # Simple mutation, 0 to 1 or 1 to 0 with a @ratio chance.
    def mutate(allele)
      if flip(@ratio)
        allele == '0' ? '1' : '0'
      else
        allele
      end
    end
  end
end
