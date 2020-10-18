# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/benchmark'

require 'genetic'

module TestChromosomes
  class TestInteger < Minitest::Test
    CHROMOSOME_CONVERSIONS = [
      [10, Genetic::Chromosome.new('1010'.rjust(32, '0'), klass: Integer)],
      [6, Genetic::Chromosome.new('110'.rjust(32, '0'), klass: Integer)],
      [26, Genetic::Chromosome.new('11010'.rjust(32, '0'), klass: Integer)],
      [11, Genetic::Chromosome.new('1011'.rjust(32, '0'), klass: Integer)],
      [80, Genetic::Chromosome.new('1010000'.rjust(32, '0'), klass: Integer)],
      [191, Genetic::Chromosome.new('10111111'.rjust(32, '0'), klass: Integer)],
      [1, Genetic::Chromosome.new('1'.rjust(32, '0'), klass: Integer)],
      [0, Genetic::Chromosome.new('0'.rjust(32, '0'), klass: Integer)],
      [3, Genetic::Chromosome.new('11'.rjust(32, '0'), klass: Integer)],
      [2, Genetic::Chromosome.new('10'.rjust(32, '0'), klass: Integer)]
    ].freeze

    def test_to_chromosome
      CHROMOSOME_CONVERSIONS.each { |(n, chromosome)| assert_equal chromosome, n.to_chromosome }
    end

    def test_from_chromosome
      CHROMOSOME_CONVERSIONS.each { |(n, chromosome)| assert_equal n, Integer.from_chromosome(chromosome) }
    end

    def test_to_and_from_chromosome_consistency
      CHROMOSOME_CONVERSIONS.each { |(n, _chromosome)| assert_equal n, Integer.from_chromosome(n.to_chromosome) }
    end
  end

  class BenchmarkInteger < Minitest::Benchmark
    def bench_to_chromosome
      assert_performance_constant(0.99, &:to_chromosome)
    end

    def bench_from_chromosome
      assert_performance_constant(0.99) { |n| Integer.from_chromosome(n.to_chromosome) }
    end
  end
end
