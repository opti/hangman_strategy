require 'spec_helper'

describe Hangman::Strategies::Utils::WordPattern do
  describe '.match_pattern' do
    it { assert_instance_of Regexp, Hangman::Strategies::Utils::WordPattern.match_pattern('---A', ['a']) }
  end

  subject { Hangman::Strategies::Utils::WordPattern.new(guessed, exclusions) }

  describe '#pattern' do
    describe 'something already guessed' do
      let(:guessed)    { '-o-e-' }
      let(:exclusions) { ['a', 'o', 'e'] }

      it { assert_equal /\A[^aoe]o[^aoe]e[^aoe]\z/i, subject.pattern }

    end

    describe 'nothing guessed yet' do
      let(:guessed)    { '-----' }
      let(:exclusions) { [] }

      it { assert_equal /\A[A-Z]{5}\z/i, subject.pattern }
    end
  end
end
