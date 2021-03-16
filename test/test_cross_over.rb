# frozen_string_literal: true

require 'minitest/autorun'

require 'teleologen'

class TestCrossOver < Minitest::Test
  NUMBER_OF_ASSERTIONS = 1000

  def test_child
    individuals = Array.new(100) do
      Teleologen::Individual.new(Teleologen.rand(0..100_000_000)) { |first_parameter| first_parameter }
    end

    NUMBER_OF_ASSERTIONS.times do
      first_parent = individuals.sample
      second_parent = individuals.sample
      child = Teleologen::CrossOver.new(first_parent, second_parent).child
      assert possible_cross_over?(child, first_parent, second_parent)
    end
  end

  private

  # Test if some child is a possible cross over of the parents.
  def possible_cross_over?(child, first_parent, second_parent)
    parent = first_parent

    child.genome.each_char.with_index do |character, index|
      next if parent.genome[index] == character

      return false if parent != first_parent

      parent = second_parent
    end

    true
  end
end
