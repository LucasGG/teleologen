# frozen_string_literal: true

class Teleologen
  # Apply cross over to chromosome reproduction.
  class CrossOver
    # Creates a new +cross_over+ model.
    def initialize(male, female)
      @male = male
      @female = female
    end

    # Generates a child.
    def child
      chromosomes = @male.genotype.map.with_index do |chromosome, index|
        pivot = rand(chromosome.string.size)

        Chromosome.new(
          @male.genotype[index].string[0...pivot] + @female.genotype[index].string[pivot...chromosome.string.size],
          klass: chromosome.klass
        )
      end

      Individual.new(*chromosomes, &@male.behavior)
    end
  end
end
