# frozen_string_literal: true

class Teleologen
  # Binary chromosome.
  class Chromosome
    attr_reader :string, :klass

    # Creates a new +chromosome+.
    def initialize(string = '', klass:)
      @string = string
      @klass = klass
    end

    # Map chromosome string per allele.
    def map
      string.split('').map
    end

    # Returns chromosome string size.
    def size
      string.size
    end

    # Converts to parameter (entity of phenotype).
    def to_parameter
      klass.from_chromosome(self)
    end

    # Return each allele.
    def alleles(...)
      string.each_char(...)
    end

    # Compare chromosomes.
    def ==(other)
      string == other.string && klass == other.klass
    end
  end
end
