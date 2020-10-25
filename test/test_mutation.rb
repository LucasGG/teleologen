# frozen_string_literal: true

require 'minitest/autorun'

require 'teleologen'

class TestMutation < Minitest::Test
  INDIVIDUALS = [
    Teleologen::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Teleologen::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Teleologen::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Teleologen::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Teleologen::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Teleologen::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Teleologen::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Teleologen::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Teleologen::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter },
    Teleologen::Individual.new(rand(0..10_000_000).to_chromosome) { |genotype| genotype.first.to_parameter }
  ].freeze

  def test_child
    100.times do
      parent = INDIVIDUALS.sample
      assert Teleologen::Mutation.new(parent).child.genome.size, parent.genome.size
    end
  end
end
