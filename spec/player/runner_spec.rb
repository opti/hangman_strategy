require 'spec_helper'

describe Hangman::Player::Runner do
  it "should run a player with indicated dictionary for one word " do
    runner = Hangman::Player::Runner.new(['-d', Fixtures::WORDS, 'lorem'])
    out, err = capture_io { runner.run! }

    assert_match /lorem.*\d\d?.*[\d\.\d{6}]{3}.*\(.*\d\.\d{4}\)/i, out
  end

  it "should run a player with indicated dictionary for multiple words " do
    runner = Hangman::Player::Runner.new(['-d', Fixtures::WORDS, 'lorem', 'ipsum'])
    out, err = capture_io { runner.run! }

    assert_match /lorem.*\d\d?.*[\d\.\d{6}]{3}.*\(.*\d\.\d{4}\)/i, out
    assert_match /ipsum.*\d\d?.*[\d\.\d{6}]{3}.*\(.*\d\.\d{4}\)/i, out
  end

  it "should run a player with indicated dictionary for a random word " do
    runner = Hangman::Player::Runner.new(['-d', Fixtures::WORDS, '-r', '1'])
    out, err = capture_io { runner.run! }

    assert_match /\b.*\d\d?.*[\d\.\d{6}]{3}.*\(.*\d\.\d{4}\)/i, out
  end
end
