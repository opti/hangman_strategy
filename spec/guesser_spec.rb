require 'spec_helper'

describe Hangman::Guesser do
  let(:word)              { 'lorem' }
  let(:max_wrong_guesses) { 5 }
  let(:dictionary)        { Hangman::Dictionary.read_file(Fixtures::WORDS) }

  subject {
    Hangman::Guesser.new(
      word: word,
      max_wrong_guesses: max_wrong_guesses,
      dictionary: dictionary
    )
  }

  it { assert_instance_of Hangman::Game, subject.game }
  it { assert_instance_of Hangman::Strategies::LetterFrequency, subject.strategy }
  it { assert_equal 1, subject.guess! }

  describe 'when word is not in dictionary' do
    let(:word) { 'lorems' }

    it { assert_instance_of Hangman::Strategies::EnglishPopularity, subject.strategy }
  end
end
