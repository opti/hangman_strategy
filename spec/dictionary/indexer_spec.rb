require 'spec_helper'

describe Hangman::Dictionary::Indexer do
  subject { Hangman::Dictionary::Indexer.new }

  it { assert_instance_of Hash, subject.storage }

  describe '#index' do
    before { subject.index('llorem') }

    it { assert_equal ({'l'=>1, 'o'=>1, 'r'=>1, 'e'=>1, 'm'=>1}), subject.storage }
  end

  describe '#ranked_letters' do
    before do
      subject.index('lorem')
      subject.index('dolor')
    end

    it { assert_equal ['l', 'o', 'r', 'e', 'm', 'd'], subject.ranked_letters }
  end

  describe '#clear' do
    before { subject.index('lorem') }

    it {
      refute_empty subject.storage
      subject.clear
      assert_empty subject.storage
    }
  end
end
