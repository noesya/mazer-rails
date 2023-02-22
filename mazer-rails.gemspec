# frozen_string_literal: true

require_relative "lib/mazer_rails/version"

Gem::Specification.new do |spec|
  spec.name = "mazer-rails"
  spec.version = MazerRails::VERSION
  spec.authors = ["Arnaud Levy"]
  spec.email = ["arnaud.levy@noesya.coop"]

  spec.summary = "Integrate Mazer in Ruby on Rails"
  spec.description = "Integrate the Mazer admin theme in a Ruby on Rails application."
  spec.homepage = "https://github.com/noesya/mazer-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/noesya/mazer-rails"
  spec.metadata["changelog_uri"] = "https://github.com/noesya/mazer-rails/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
 
  spec.add_runtime_dependency 'sassc-rails', '>= 2.0.0'
  spec.add_runtime_dependency 'autoprefixer-rails', '>= 9.1.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
