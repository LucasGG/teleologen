# frozen_string_literal: true

require 'minitest/autorun'

require 'teleologen'

class TestNumberApproximation < Minitest::Test
  GOAL = 4_726_487
  POPULATION_SIZE = 100
  NUMBER_OF_GENERATIONS = 500
  MUTATION_RATIO = 0.03125 / 2.0
  TELEOLOGY = Teleologen::Teleology.new { |behavior| GOAL / (((behavior - GOAL).abs**1.8) + 1) }

  def test_approximate_goal
    Teleologen.random_source = Random.new(43_942)

    population = initial_population(POPULATION_SIZE)

    (NUMBER_OF_GENERATIONS - 1).times do
      population = next_population(population, POPULATION_SIZE, teleology: TELEOLOGY, mutation_ratio: MUTATION_RATIO)
    end

    best_individual = population.max_by { |individual| TELEOLOGY.calculate(individual.call) }

    assert best_individual.phenotype, [4_726_487]
  end

  private

  # Generate initial population.
  def initial_population(size)
    Array.new(size) do
      Teleologen::Individual.new(Teleologen.rand(0..100_000)) { |first_parameter| first_parameter }
    end
  end

  # Generate next population.
  def next_population(old_population, size, teleology:, mutation_ratio:)
    Teleologen::Reproduction.new(old_population)
                            .reproduce(size, teleology: teleology, mutation_ratio: mutation_ratio)
  end
end
