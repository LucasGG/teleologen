# frozen_string_literal: true

require 'minitest/autorun'

require 'teleologen'

class TestMutation < Minitest::Test
  NUMBER_OF_ASSERTIONS = 100

  def test_child
    individuals = Array.new(100) do
      Teleologen::Individual.new(Teleologen.rand(0..10_000_000)) { |first_parameter| first_parameter }
    end

    NUMBER_OF_ASSERTIONS.times do
      parent = individuals.sample
      assert Teleologen::Mutation.new(parent).child.genome.size, parent.genome.size
    end
  end
end
