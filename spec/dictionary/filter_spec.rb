require 'spec_helper'

describe Hangman::Dictionary::Filter do
  let(:words) { Set.new ['LOREM', 'IPSUM', 'DOLOR', 'SIT', 'AMET'] }

  subject { Hangman::Dictionary::Filter.new(words) }

  it { assert_instance_of Hangman::Dictionary::Indexer, subject.indexer }

  describe '#filter!' do
    before { subject.filter!(/\A[A-Z]{5}\z/i) }

    it { assert_equal 3, subject.words.size }
    it { refute_empty subject.letters  }
  end

  describe '#shift_word' do
    it { assert_equal 'LOREM', subject.shift_word }
    it {
      subject.shift_word
      assert_equal 4, subject.words.size
    }
  end

  describe '#letters' do
    before { subject.filter!(/\A[A-Z]{5}\z/i) }

    it { assert_equal ['L', 'O', 'R', 'M', 'E', 'I', 'P', 'S', 'U', 'D'], subject.letters }
  end
end
