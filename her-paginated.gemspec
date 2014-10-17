# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'her/paginated/version'

Gem::Specification.new do |spec|
  spec.name          = "her-paginated"
  spec.version       = Her::Paginated::VERSION
  spec.authors       = ["Daniel Blanco Rojas"]
  spec.email         = ["daniel.blancorojas@gmail.com"]
  spec.summary       = %q{Pagination for Her models.}
  spec.description   = %q{Makes Her aware of APIs that return pagination headers.}
  spec.homepage      = "https://github.com/DanielBlanco/her-paginated"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "her"

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'

end
