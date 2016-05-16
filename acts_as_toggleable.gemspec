# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'acts_as_toggleable/version'

Gem::Specification.new do |spec|
  spec.name        = 'acts_as_toggleable'
  spec.version     = ActsAsToggleable::VERSION
  spec.authors     = ['PJ Kelly']
  spec.email       = ['pj@crushlovely.com']
  spec.homepage    = 'https://github.com/crushlovely/acts_as_toggleable'
  spec.summary     = 'Toggleable attributes for your ActiveRecord models.'
  spec.description = 'Toggleable attributes for your ActiveRecord models.'

  spec.rubyforge_project = 'acts_as_toggleable'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency('activerecord', '>= 4.2.0.beta4')

  spec.add_dependency('activesupport', '>= 4.2.0.beta4')

  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'minitest-utils'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency('rubocop')
  spec.add_development_dependency('guard-rubocop')
  spec.add_development_dependency('guard-minitest')
  spec.add_development_dependency('codeclimate-test-reporter')
end
