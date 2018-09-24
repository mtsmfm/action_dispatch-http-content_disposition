
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "action_dispatch/http/content_disposition/version"

Gem::Specification.new do |spec|
  spec.name          = "action_dispatch-http-content_disposition"
  spec.version       = ActionDispatch::Http::ContentDisposition::VERSION
  spec.authors       = ["Fumiaki MATSUSHIMA"]
  spec.email         = ["mtsmfm@gmail.com"]

  spec.summary       = %q{Backport https://github.com/rails/rails/pull/33829 to older Rails}
  spec.description   = %q{Backport https://github.com/rails/rails/pull/33829 to older Rails}
  spec.homepage      = "https://github.com/mtsmfm/action_dispatch-http-content_disposition"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack", ">= 4.2", "< 6"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "pry-byebug"
end
