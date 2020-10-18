# frozen_string_literal: true

# https://github.com/wycats/newgem-template/blob/master/newgem.gemspec
Gem::Specification.new do |specification|
  specification.name = 'genetic'

  specification.version = '0.0.0'

  specification.summary = 'Genetic'

  specification.description = <<-DESCRIPTION
    Genetic is good!
  DESCRIPTION

  specification.authors = ['Lucas Guimarães Gonçalves']
  specification.email = 'lucasggcel@gmail.com'
  specification.homepage = 'https://github.com/lucasgg/genetic'

  # https://guides.rubygems.org/make-your-own-gem/
  specification.files = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  specification.licenses = ['MIT']

  specification.executables << 'genetic'

  # specification.metadata = {
  #   "bug_tracker_uri"   => "https://github.com/ruby/rake/issues",
  #   "changelog_uri"     => "https://github.com/ruby/rake/blob/v#{s.version}/History.rdoc",
  #   "documentation_uri" => "https://ruby.github.io/rake",
  #   "source_code_uri"   => "https://github.com/ruby/rake/tree/v#{s.version}",
  # }
end
