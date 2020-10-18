require 'minitest/autorun'
require 'genetic'

class ChromosomesSpec
  class IntegerSpec < Minitest::Test
    def test_to_chromosome
      assert_equal Genetic::Chromosome.new('1010'.rjust(32, '0'), klass: Integer), 10.to_chromosome
      assert_equal Genetic::Chromosome.new('110'.rjust(32, '0'), klass: Integer), 6.to_chromosome
      assert_equal Genetic::Chromosome.new('11010'.rjust(32, '0'), klass: Integer), 26.to_chromosome
      assert_equal Genetic::Chromosome.new('1011'.rjust(32, '0'), klass: Integer), 11.to_chromosome
      assert_equal Genetic::Chromosome.new('1010000'.rjust(32, '0'), klass: Integer), 80.to_chromosome
      assert_equal Genetic::Chromosome.new('10111111'.rjust(32, '0'), klass: Integer), 191.to_chromosome
      assert_equal Genetic::Chromosome.new('1'.rjust(32, '0'), klass: Integer), 1.to_chromosome
      assert_equal Genetic::Chromosome.new('0'.rjust(32, '0'), klass: Integer), 0.to_chromosome
      assert_equal Genetic::Chromosome.new('11'.rjust(32, '0'), klass: Integer), 3.to_chromosome
      assert_equal Genetic::Chromosome.new('10'.rjust(32, '0'), klass: Integer), 2.to_chromosome
    end

    def test_from_chromosome
      assert_equal 10, Integer.from_chromosome(Genetic::Chromosome.new('1010'.rjust(32, '0'), klass: Integer))
      assert_equal 6, Integer.from_chromosome(Genetic::Chromosome.new('110'.rjust(32, '0'), klass: Integer))
      assert_equal 26, Integer.from_chromosome(Genetic::Chromosome.new('11010'.rjust(32, '0'), klass: Integer))
      assert_equal 11, Integer.from_chromosome(Genetic::Chromosome.new('1011'.rjust(32, '0'), klass: Integer))
      assert_equal 80, Integer.from_chromosome(Genetic::Chromosome.new('1010000'.rjust(32, '0'), klass: Integer))
      assert_equal 191, Integer.from_chromosome(Genetic::Chromosome.new('10111111'.rjust(32, '0'), klass: Integer))
      assert_equal 1, Integer.from_chromosome(Genetic::Chromosome.new('1'.rjust(32, '0'), klass: Integer))
      assert_equal 0, Integer.from_chromosome(Genetic::Chromosome.new('0'.rjust(32, '0'), klass: Integer))
      assert_equal 3, Integer.from_chromosome(Genetic::Chromosome.new('11'.rjust(32, '0'), klass: Integer))
      assert_equal 2, Integer.from_chromosome(Genetic::Chromosome.new('10'.rjust(32, '0'), klass: Integer))
    end
  end
end
