require 'spec_helper'

describe Hangman::Dictionary::Storage do
  subject { Hangman::Dictionary::Storage.new }

  it { assert_kind_of Hash, subject.entries }

  describe '#add' do
    before { subject.add("lorem\n") }

    it { assert_equal ({5 => Set.new(["LOREM"])}), subject.entries }
  end

  describe '#fetch' do
    before { subject.add('lorem') }

    it { assert_equal Set.new(['LOREM']), subject.fetch(5) }
  end

  describe '#sample' do
    before do
      subject.add('lorem').add('ipsum').add('amet')

      it { assert_equal 3, subject.sample(3).size }
      it { assert_includes ['LOREM', 'IPSUM', 'AMET'], subject.sample(1)  }
    end
  end
end
