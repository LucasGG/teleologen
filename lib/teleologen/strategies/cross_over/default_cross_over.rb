# frozen_string_literal: true

class Teleologen
  # Implementation of a Simple Cross Over.
  class DefaultCrossOver < CrossOver
    def apply
      chromosomes = @first_invidual.genotype.map.with_index do |chromosome, index|
        next_chromosome(chromosome, @second_individual.genotype[index])
      end

      behavior = @first_invidual.behavior

      Individual.new(*chromosomes.map(&:to_parameter), &behavior)
    end

    private

    # Generate next chromosome for child.
    def next_chromosome(first_invidual_chromosome, second_individual_chromosome)
      size = first_invidual_chromosome.size
      pivot = rand(size)

      raise 'male and female chromosome must have the same size' if size != second_individual_chromosome.size

      Chromosome.new(
        first_invidual_chromosome.string[0...pivot] + second_individual_chromosome.string[pivot...size],
        klass: first_invidual_chromosome.klass
      )
    end
  end
end
