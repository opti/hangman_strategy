require 'spec_helper'

describe Hangman::Strategies::LetterFrequency do
  let(:words) { Set.new ['lorem', 'ipsum', 'solor', 'sit', 'amet'] }
  let(:game)  { Hangman::Game.new('lorem', 5) }

  subject { Hangman::Strategies::LetterFrequency.new(game, words) }

  it { assert_instance_of Hangman::Dictionary::Filter, subject.dictionary }
  it { assert_equal game, subject.game }

  it "makes guesses" do
    assert_equal 'L----', subject.next_guess!
    assert_equal 'LOREM', subject.next_guess!
  end
end
