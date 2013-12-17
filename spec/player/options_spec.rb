require 'spec_helper'

describe Hangman::Player::Options do
  subject { Hangman::Player::Options.new(opts) }

  describe "default options" do
    let(:opts) { ['lorem'] }

    it { assert_equal Hangman::Player::Options::DEFAULT_DICTIONARY, subject.dictionary }
    it { assert_equal Hangman::Player::Options::DEFAULT_MAX_WRONG_GUESSES, subject.max_wrong_guesses }
    it { assert_equal ['lorem'], subject.words }
  end

  describe "specified options" do
    let(:opts) { ['-d', 'words', '-m', '4', '-r', '1000'] }

    it { assert_equal 'words', subject.dictionary }
    it { assert_equal 4, subject.max_wrong_guesses }
    it { assert_equal 1000, subject.random }
  end

  describe "multiple words" do
    let(:opts) { ['lorem', 'ipsum'] }

    it { assert_equal ['lorem', 'ipsum'], subject.words }
  end
end
