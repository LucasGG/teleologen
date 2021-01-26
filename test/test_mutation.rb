# frozen_string_literal: true

require 'minitest/autorun'

require 'teleologen'

class TestMutation < Minitest::Test
  # TODO: Test with seed.

  INDIVIDUALS = [
    Teleologen::Individual.new(rand(0..10_000_000), &:first),
    Teleologen::Individual.new(rand(0..10_000_000), &:first),
    Teleologen::Individual.new(rand(0..10_000_000), &:first),
    Teleologen::Individual.new(rand(0..10_000_000), &:first),
    Teleologen::Individual.new(rand(0..10_000_000), &:first),
    Teleologen::Individual.new(rand(0..10_000_000), &:first),
    Teleologen::Individual.new(rand(0..10_000_000), &:first),
    Teleologen::Individual.new(rand(0..10_000_000), &:first),
    Teleologen::Individual.new(rand(0..10_000_000), &:first),
    Teleologen::Individual.new(rand(0..10_000_000), &:first)
  ].freeze

  def test_child
    100.times do
      parent = INDIVIDUALS.sample
      assert Teleologen::Mutation.new(parent).child.genome.size, parent.genome.size
    end
  end
end
