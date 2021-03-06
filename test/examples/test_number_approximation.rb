# frozen_string_literal: true

require 'minitest/autorun'

require 'teleologen'

class TestNumberApproximation < Minitest::Test
  GOAL = 4_726_487
  POPULATION_SIZE = 100
  NUMBER_OF_GENERATIONS = 500

  def test_approximate_goal
    teleology = Teleologen::Teleology.new do |behavior|
      GOAL / ((behavior - GOAL).abs**1.8 + 1) # Objetive function.
    end

    population = initial_population(POPULATION_SIZE)

    (NUMBER_OF_GENERATIONS - 1).times do
      population = next_population(population, POPULATION_SIZE, teleology: teleology, mutation_ratio: 0.03125 / 2.0)
    end

    best_individual = population.max_by { |individual| teleology.calculate(individual.call) }

    puts_individual(best_individual, teleology: teleology)
  end

  private

  def initial_population(size)
    Array.new(size) { Teleologen::Individual.new(rand(0..100_000)) { |first_parameter| first_parameter } }
  end

  def next_population(old_population, size, teleology:, mutation_ratio:)
    Teleologen::Reproduction.new(old_population).reproduce(size, teleology: teleology, mutation_ratio: mutation_ratio)
  end

  def puts_individual(individual, teleology:)
    puts %(
      Individual: #{individual}
      Fitness: #{teleology.calculate(individual.call)}
      Phenotype: [#{individual.phenotype.map(&:to_s).join(', ')}]
      Genome: #{individual.genome}
    )
  end
end
