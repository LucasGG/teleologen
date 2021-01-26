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
        next_chromosome(chromosome, @female.genotype[index])
      end

      behavior = @male.behavior

      Individual.new(*chromosomes.map(&:to_parameter), &behavior)
    end

    private

    # Generate next chromosome for child.
    def next_chromosome(male_chromosome, female_chromosome)
      size = male_chromosome.size
      pivot = rand(size)

      raise 'male and female chromosome must have the same size' if size != female_chromosome.size

      Chromosome.new(
        male_chromosome.string[0...pivot] + female_chromosome.string[pivot...size],
        klass: male_chromosome.klass
      )
    end
  end
end
