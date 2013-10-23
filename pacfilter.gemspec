# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
#lib = File.expand_path('../lib', __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pacfilter/version'

Gem::Specification.new do |spec|
  spec.name          = "pacfilter"
  spec.version       = Pacfilter::VERSION
  spec.authors       = ["yshtak"]
  spec.email         = ["yshtak@gmail.com"]
  spec.description   = %q{ベイジアンフィルタを用いた有害文書を判定するライブラリ}
  spec.summary       = %q{有害文書を自動判別するためのgem}
  spec.homepage      = ""
  spec.license       = "MIT"

  #spec.files         = `git ls-files`.split($/)
  spec.files        = Dir.glob("lib/**/*") + %w(lib/jar/kuromoji-0.7.7.jar)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency('rjb', '~> 1.4.8')
end
