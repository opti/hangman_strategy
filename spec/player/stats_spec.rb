require 'spec_helper'

describe Hangman::Player::Stats do
  subject { Hangman::Player::Stats }

  it 'should draw the main stats table' do
    out, err = capture_io { subject.benchmark { 1 + 1 } }

    assert_equal (<<-END
---------------------------------|---------|--------------------------------------------------------
                     Secret Word |   Score |   Time:       user     system      total       real
---------------------------------|---------|--------------------------------------------------------
---------------------------------|---------|--------------------------------------------------------
                         Average |    0.00 |                                                 0.0000
                           Total |       0 |                                                 0.0000
---------------------------------|---------|--------------------------------------------------------
END
    ), out
  end
end
