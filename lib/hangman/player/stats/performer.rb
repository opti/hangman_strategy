require 'benchmark'
require 'ostruct'

module Hangman
  module Player
    module Stats
      class Performer
        attr_reader :result

        def initialize
          @result = OpenStruct.new
        end

        def measure(args, &block)
          result.word = args.fetch(:word)
          result.bm = Benchmark.measure { result.score = block.call }

          result
        end
      end
    end
  end
end
