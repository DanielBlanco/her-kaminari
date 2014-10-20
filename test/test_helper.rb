# -*- encoding : utf-8 -*-
# test/test_helper.rb

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

require 'her/paginated'

# TODO: For some reason my tests are not requiring paginated module
#       need to figure out why?
#include Her::Paginated

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir['#{File.dirname(__FILE__)}/support/**/*.rb'].each {|f| require f}

