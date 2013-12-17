require 'hangman/player/stats/performer'
require 'hangman/player/stats/report'

module Hangman
  module Player
    module Stats

      def self.benchmark
        report = Report.new

        puts report.hr
        puts report.header
        puts report.hr

        yield(report)

        puts report.hr
        puts report.average_row
        puts report.total_row
        puts report.hr
      end
    end
  end
end
