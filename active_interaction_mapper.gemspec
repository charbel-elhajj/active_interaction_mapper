# frozen_string_literal: true

require_relative "lib/active_interaction_mapper/version"

Gem::Specification.new do |spec|
  spec.name          = "active_interaction_mapper"
  spec.version       = ActiveInteractionMapper::VERSION
  spec.authors       = ["charbel-elhajj"]
  spec.email         = ["charbelelhajj99@hotmail.com"]

  spec.summary       = "Allows to track the interactions between ActiveInteraction"
  spec.description   = "This gem allows the tracking of ActiveInteractions interactions.\n
                        This is done by tracking the .execute methode that is overridden in each class inheriting from ActiveInteraction.\n
                        To be able to trace function calls, I used Ruby's TracePoint class and to draw the graphs I used the 'ruby-graphviz' gem.\n
                        Note that you need to install GraphViz in your environment and have its path in your path environment variable to be able to draw graphs.\n"
  spec.homepage      = "https://github.com/charbel-elhajj/active_interaction_mapper"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "https://github.com/charbel-elhajj/active_interaction_mapper"

  spec.metadata["homepage_uri"] = 'https://github.com/charbel-elhajj/active_interaction_mapper'
  spec.metadata["source_code_uri"] = "https://github.com/charbel-elhajj/active_interaction_mapper"
  spec.metadata["changelog_uri"] = "https://github.com/charbel-elhajj/active_interaction_mapper"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
