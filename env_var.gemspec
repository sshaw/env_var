lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "env_var/version"

Gem::Specification.new do |spec|
  spec.name          = "env_var"
  spec.version       = EnvVar::VERSION
  spec.authors       = ["sshaw"]
  spec.email         = ["skye.shaw@gmail.com"]

  spec.summary       = %q{Check if an environment variable is set to an enabled or disabled value. Fetch an environment variable as an Array of Strings or Symbols.}
  #spec.description   = %q{Check if an environment variable is set to an enabled or disabled value. Fetch an environment variable as an Array of Strings or Symbols.}
  spec.homepage      = "https://github.com/sshaw/env_var"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
