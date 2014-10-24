# -*- encoding : utf-8 -*-
# test/test_helper.rb
ENV['RACK_ENV'] = 'test'

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'grape'
require 'grape-kaminari'
require 'json'
require 'rack/test'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}


require 'her/paginated'

