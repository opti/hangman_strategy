require 'spec_helper'

describe Hangman::Dictionary do
  let(:reader)     { Minitest::Mock.new }
  let(:dictionary) { Hangman::Dictionary }

  describe '.read_file' do
    subject { dictionary.read_file(Fixtures::WORDS) }

    it { subject.must_be_instance_of Hangman::Dictionary::Storage }
  end
end
