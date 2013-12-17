require 'spec_helper'

describe Hangman::Dictionary::Reader do
  let(:file) { Fixtures::WORDS }

  subject { Hangman::Dictionary::Reader.new(file) }

  it { assert_instance_of Hangman::Dictionary::Storage, subject.storage }
  it { assert_empty subject.storage.entries }

  describe '#read!' do
    before { subject.read! }

    it { refute_empty subject.storage.entries }
    it { assert subject.storage.fetch(5).include?('LOREM') }
  end
end
