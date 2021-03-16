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

require 'teleologen/chromosome'
require 'teleologen/individual'
require 'teleologen/reproduction'
require 'teleologen/teleology'
require 'teleologen/roullete'
require 'teleologen/cross_over'
require 'teleologen/mutation'

require 'teleologen/chromosomes/integer'
