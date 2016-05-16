require 'bundler/setup'

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'acts_as_toggleable'

require 'minitest/utils'
require 'minitest/autorun'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')

load('support/schema.rb')
require 'support/article'
require 'support/story'
