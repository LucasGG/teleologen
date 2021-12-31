# frozen_string_literal: true

# Monkey patch integer class.
class Integer
  TELEOLOGEN_TO_LAMBDA = ->(n) { n <= 1 ? (n % 2).to_s : TELEOLOGEN_TO_LAMBDA.call(n / 2).concat((n % 2).to_s) }

  # Converts an integer to chromosome.
  def to_chromosome
    Teleologen::Chromosome.new(TELEOLOGEN_TO_LAMBDA.call(self).rjust(32, '0'), klass: self.class)
  end

  # Converts a chromosome to integer.
  def self.from_chromosome(chromosome)
    chromosome_size = chromosome.size
    chromosome.map.with_index { |allele, locus| allele.to_i * (2**(chromosome_size - 1 - locus)) }.sum
  end
end
