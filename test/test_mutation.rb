# frozen_string_literal: true

require 'minitest/autorun'

require 'teleologen'

class TestMutation < Minitest::Test
  def test_child
    Teleologen.random_source = Random.new(12_938)

    assert new_mutated_child_genome, '00000000010000111111101100010011'
    assert new_mutated_child_genome, '00000000010010001100000001011101'
    assert new_mutated_child_genome, '00000000000010110100111100111111'
    assert new_mutated_child_genome, '00000000100000000011011010110001'
    assert new_mutated_child_genome, '00000000001011000111110110011001'
  end

  private

  def parents
    @parents ||= Array.new(100) do
      Teleologen::Individual.new(Teleologen.rand(0..10_000_000)) { |first_parameter| first_parameter }
    end
  end

  def new_mutated_child_genome
    parent = parents.sample(random: Teleologen.random_source)
    Teleologen::Mutation.new(parent).child.genome
  end
end
