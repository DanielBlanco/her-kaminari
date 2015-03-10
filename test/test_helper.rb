# -*- encoding : utf-8 -*-
# test/test_helper.rb
ENV['RACK_ENV'] = 'test'

require 'coveralls'
Coveralls.wear!

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'json'
require 'rack/test'
require 'pry'
require 'grape'
require 'her/kaminari'
require 'support/her_api'

