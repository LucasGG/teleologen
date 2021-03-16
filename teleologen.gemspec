# frozen_string_literal: true

require_relative 'lib/teleologen/version'

Gem::Specification.new do |specification|
  specification.name = 'teleologen'
  specification.version = Teleologen::VERSION
  specification.required_ruby_version = Gem::Requirement.new('~> 3.0.0')

  specification.summary = 'Teleologen is a Simple and Cool Genetic Algorithm Gem'
  specification.description = <<-DESCRIPTION
    Simple and cool genetic algorithm implementation.
  DESCRIPTION

  specification.authors = ['Lucas Guimarães Gonçalves']
  specification.email = 'lucasggcel@gmail.com'
  specification.homepage = 'https://github.com/lucasgg/teleologen'
  specification.licenses = ['MIT']

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  specification.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  specification.executables << 'teleologen'
end
