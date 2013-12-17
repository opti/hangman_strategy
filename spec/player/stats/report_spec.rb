require 'spec_helper'

describe Hangman::Player::Stats::Report do
  subject { Hangman::Player::Stats::Report.new }

  it { assert_equal [], subject.results }

  describe '#report' do
    it {
      out, err = capture_io { subject.report(word: 'lorem') { 1 + 1 } }
      assert_match /lorem.*\d\d?.*[\d\.\d{6}]{3}.*\(.*\d\.\d{4}\)/i, out
    }
  end

  describe '#header' do
    it {
      assert_output(
        "                     Secret Word |   Score |   Time:       user     system      total       real"
      ) { print subject.header }
    }
  end

  describe '#hr' do
    it {
      assert_output(
        '---------------------------------|---------|--------------------------------------------------------'
      ) { print subject.hr }
    }
  end

  describe '#average_row' do
    it {
      assert_output(
        "                         Average |    0.00 |                                                 0.0000"
      ) { print subject.average_row }
    }
  end

  describe '#total_row' do
    it {
      assert_output(
        "                           Total |       0 |                                                 0.0000"
      ) { print subject.total_row }
    }
  end
end
