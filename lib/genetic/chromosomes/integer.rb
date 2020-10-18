# frozen_string_literal: true

class Integer
  def to_chromosome
    functor = lambda { |n| n <= 1 ? (n % 2).to_s : functor.call(n / 2).concat((n % 2).to_s) }
    Genetic::Chromosome.new(functor.call(self).rjust(32, '0'), klass: self.class)
  end

  def self.from_chromosome(chromosome)
    chromosome_size = chromosome.size
    chromosome.map.with_index { |allele, locus| allele.to_i * 2**(chromosome_size - 1 - locus) }.sum
  end
end
