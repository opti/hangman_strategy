require 'coveralls'
Coveralls.wear!

require 'hangman_strategy'

gem 'minitest'
require 'minitest/autorun'

module Fixtures
  WORDS = File.expand_path('../fixtures/words.txt', __FILE__)
end
