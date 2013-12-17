require 'spec_helper'

describe Hangman::Game do
  subject { game }

  let(:game) { Hangman::Game.new(word, max_wrong_guesses) }
  let(:word) { 'lorem' }
  let(:max_wrong_guesses) { 5 }

  it { subject.game.must_be_instance_of Hangman::HangmanGame }
  it { subject.guessed.must_equal "-----" }
  it { subject.in_progress?.must_equal true }
  it { subject.current_score.must_equal 0 }
  it { subject.word_length.must_equal 5 }

  describe 'guessing letter' do
    describe 'when letter is correct' do
      before { subject.guess_letter('l') }

      it { subject.guessed.must_equal 'L----' }
      it { subject.current_score.must_equal 1 }
      it { subject.in_progress?.must_equal true }
      it { subject.correctly_guessed_letters.must_include 'L' }
      it { subject.incorrectly_guessed_letters.must_be_empty }
      it { subject.all_guessed_letters.must_include 'L' }
    end

    describe 'when letter is not correct' do
      before { subject.guess_letter('i') }

      it { subject.guessed.must_equal '-----' }
      it { subject.current_score.must_equal 1 }
      it { subject.in_progress?.must_equal true }
      it { subject.correctly_guessed_letters.must_be_empty }
      it { subject.incorrectly_guessed_letters.must_include 'I' }
      it { subject.all_guessed_letters.must_include 'I' }
    end
  end

  describe 'guessing correct word' do
    before { subject.guess_word('lorem') }

    it { subject.guessed.must_equal 'LOREM' }
    it { subject.in_progress?.must_equal false }
  end

  describe 'guessing incorrect word' do
    before { subject.guess_word('ipsum') }

    it { subject.guessed.must_equal '-----' }
    it { subject.in_progress?.must_equal true }
  end

  describe 'stop guessing' do
    let(:max_wrong_guesses) { 1 }

    before do
      subject.guess_letter('i')
      subject.guess_letter('a')
    end

    it { subject.in_progress?.must_equal false }
  end
end
