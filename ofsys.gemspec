$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ofsys/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = 'ofsys'
  gem.version     = Ofsys::VERSION
  gem.authors     = ['Alexandr Borisov', 'Sergey Zyablitsky']
  gem.email       = ['aishek@gmail.com', 'sergey.zyablitsky@gmail.com']
  gem.description = 'Ofsys.com API wrapper for Ruby language'
  gem.summary     = 'Provides interface for ofsys.com (inteligentemails.com) service API'
  gem.homepage    = 'https://github.com/the-furnish/ofsys'
  gem.licenses    = ['MIT']

  gem.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  gem.test_files = Dir['spec/**/*']

  gem.add_runtime_dependency 'yajl-ruby'

  gem.add_development_dependency 'activesupport'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-partial-hash'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'rubocop'
end
