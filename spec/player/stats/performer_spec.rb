require 'spec_helper'

describe Hangman::Player::Stats::Performer do
  subject { Hangman::Player::Stats::Performer.new }

  it { assert_instance_of OpenStruct, subject.result }

  describe '#measure' do
    before { subject.measure(word: 'lorem') { 1 + 1 } }

    it { assert_equal 'lorem', subject.result.word }
    it { assert_equal 2, subject.result.score }
    it { assert_instance_of Benchmark::Tms, subject.result.bm }
  end
end
