# -*- encoding : utf-8 -*-
# test/test_helper.rb
require 'her/paginated'

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir['#{File.dirname(__FILE__)}/support/**/*.rb'].each {|f| require f}

