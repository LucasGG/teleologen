# frozen_string_literal: true

# Main class.
class Teleologen
  class Error < StandardError; end

  class << self
    attr_accessor :random_source

    # Generates rand number from random source.
    def rand(*args)
      random_source.rand(*args)
    end
  end

  self.random_source = Kernel
end

# Load mixins.
require 'teleologen/mixins/random_operators'

# Load GA main classes.
require 'teleologen/chromosome'
require 'teleologen/individual'
require 'teleologen/reproduction'
require 'teleologen/teleology'
require 'teleologen/roulette'
require 'teleologen/cross_over'
require 'teleologen/mutation'

# Load chromosome converter implementations.
require 'teleologen/chromosomes/integer'
