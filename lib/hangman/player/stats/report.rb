module Hangman
  module Player
    module Stats
      class Report
        COLUMN_SYMBOL = '|'
        ROW_SYMBOL = '-'

        attr_reader :results

        def initialize
          @results = []
        end

        def report(args, &block)
          results << result = Performer.new.measure(args, &block)

          puts row(result)
          result
        end

        def header
          [
            format('%32s ', 'Secret Word'),
            format('%8s ', 'Score'),
            format('%8s %10s %10s %10s %10s', 'Time:', 'user', 'system', 'total', 'real')
          ].join(COLUMN_SYMBOL)
        end

        def hr
          [
            ROW_SYMBOL * 33,
            ROW_SYMBOL * 9,
            ROW_SYMBOL * 56
          ].join(COLUMN_SYMBOL)
        end

        def average_row
          [
            format('%32s ', 'Average'),
            format('%8.2f ', average_score),
            format('%55.4f', average_time)
          ].join(COLUMN_SYMBOL)
        end

        def total_row
          [
            format('%32s ', 'Total'),
            format('%8d ', total_score),
            format('%55.4f', total_time)
          ].join(COLUMN_SYMBOL)
        end

        private

        def row(result)
          [
            format('%32s ', result.word),
            format('%8d ', result.score),
            format('%55s', result.bm.format("%10.6u %10.6y %10.6t %10.4r"))
          ].join(COLUMN_SYMBOL)
        end

        def total_time
          @__total_time ||= results.inject(0) { |sum, result| sum + result.bm.real }
        end

        def total_score
          @__total_score ||= results.inject(0) { |sum, result| sum + result.score }
        end

        def average_time
          total_time / results.size
        rescue ZeroDivisionError
          0
        end

        def average_score
          results.empty? ? 0.0 : total_score.to_f / results.size
        end
      end
    end
  end
end
