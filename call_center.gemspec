require_relative 'lib/call_center/version'

Gem::Specification.new do |spec|
  spec.name          = "call_center"
  spec.version       = CallCenter::VERSION
  spec.authors       = ["Dan Thomas"]
  spec.email         = ["dan@ideacrew.com"]

  spec.summary       = %q{A plugin to manage call center services}
  spec.description   = %q{A plugin to manage call center services}
  spec.homepage      = "https://github.com/ideacrew/call_center"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ideacrew/call_center"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'i18n',                     '~> 1.6'
  spec.add_dependency 'aws-sdk-connect',          '~> 1.0'
  spec.add_dependency 'dry-validation',           '~> 1.2'
  spec.add_dependency 'dry-struct',               '~> 1.0'
  spec.add_dependency 'dry-monads',               '~> 1.2'
  spec.add_dependency 'dry-matcher',              '~> 0.7'

  spec.add_development_dependency "bundler",          "~> 2.0"
  spec.add_development_dependency 'rspec',            '~> 3.9'
  spec.add_development_dependency "rubocop",          '~> 0.74.0'
  spec.add_development_dependency "yard",             "~> 0.9"
  spec.add_development_dependency 'pry-byebug'
end
