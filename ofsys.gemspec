$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ofsys/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = 'ofsys'
  gem.version     = Ofsys::VERSION
  gem.authors     = ['Alexandr Borisov']
  gem.email       = 'aishek@gmail.com'
  gem.summary     = 'Provides interface for ofsys.com service'
  gem.homepage  = 'https://github.com/aishek/ofsys'
  gem.licenses  = ['MIT']

  gem.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  gem.test_files = Dir['spec/**/*']

  gem.add_runtime_dependency 'yajl-ruby'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'rubocop'
end
