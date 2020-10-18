# frozen_string_literal: true

require 'minitest/autorun'

require 'genetic'

class TestMutation < Minitest::Test
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
      parent = INDIVIDUALS.sample
      assert Genetic::Mutation.new(parent).child.genome.size, parent.genome.size
    end
  end
end
