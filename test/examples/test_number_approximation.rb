# frozen_string_literal: true

require 'minitest/autorun'

require 'genetic'

class TestNumberApproximation < Minitest::Test
  GOAL = 4_726_487

  def test_approximate_goal
    teleology = Genetic::Teleology.new do |behavior|
      GOAL / ((behavior - GOAL).abs**1.8 + 1)
    end

    population = Array.new(100) do
      Genetic::Individual.new(rand(0..100_000).to_chromosome) do |genotype|
        genotype.first.to_parameter
      end
    end

    500.times do
      population = Genetic::Reproduction.new(population)
                                        .reproduce(100, teleology: teleology, mutation_ratio: 0.03125 / 2.0)
    end

    best = population.max_by { |individual| teleology.calculate(individual.call) }

    puts %(
      Individual: #{best}
      Parameters: #{best.genotype.map(&:to_parameter).join(', ')}
      Fitness: #{teleology.calculate(best.call)}
      Genome: #{best.genome}
    )
  end
end