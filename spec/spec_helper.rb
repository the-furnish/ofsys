ENV['RAILS_ENV'] ||= 'test'
require 'rspec-partial-hash'

require 'ofsys'

require 'coveralls'
Coveralls.wear!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = "#{File.dirname(__FILE__)}/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end
