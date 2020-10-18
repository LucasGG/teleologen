# frozen_string_literal: true

class Genetic
  # Binary chromosome.
  class Chromosome
    attr_reader :string
    attr_reader :klass

    def initialize(string = '', klass:)
      @string = string
      @klass = klass
    end

    def map
      string.split('').map
    end

    def size
      string.size
    end

    def to_parameter
      klass.from_chromosome(self)
    end

    def alleles(...)
      string.each_char(...)
    end

    def ==(other)
      self.string == other.string && self.klass == other.klass
    end
  end
end
