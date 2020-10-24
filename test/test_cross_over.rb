# frozen_string_literal: true

require 'minitest/autorun'

require 'genetic'

class TestCrossOver < Minitest::Test
  INDIVIDUALS = [
    Genetic::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Genetic::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Genetic::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Genetic::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Genetic::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Genetic::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Genetic::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Genetic::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Genetic::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Genetic::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter }
  ].freeze

  def test_child
    100.times do
      first_parent = INDIVIDUALS.sample
      second_parent = INDIVIDUALS.sample
      child = Genetic::CrossOver.new(first_parent, second_parent).child
      assert child?(child, first_parent, second_parent)
    end
  end

  def child?(child, first_parent, second_parent)
    parent = first_parent
    parent_genome = parent.genome

    return parent_genome == second_parent.genome if first_parent == second_parent

    child.genome.each_char.with_index do |character, index|
      next if parent_genome[index] == character

      if parent == first_parent
        parent = second_parent
        parent_genome = parent.genome
        next
      end

      return false
    end

    true
  end
end