require 'spec_helper'

describe Hangman::Strategies::EnglishPopularity do
  subject { Hangman::Strategies::EnglishPopularity.new(game) }

  let(:game) { Minitest::Mock.new }

  before do
    game.expect(:all_guessed_letters, ['E'])
  end

  it { assert_equal 'S', subject.letter }
  it {
    game.expect(:guess_letter, true, ['S'])
    subject.next_guess!
    game.verify
  }
end
