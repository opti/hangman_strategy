module Hangman
  module Dictionary
    class Filter
      attr_reader :words, :indexer

      def initialize(words)
        @words = words
        @indexer = Indexer.new
      end

      def filter!(pattern)
        indexer.clear

        words.keep_if do |word|
          word.match(pattern) && indexer.index(word)
        end

        self
      end

      def shift_word
        word = words.first
        words.subtract [word]
        word
      end

      def letters
        indexer.ranked_letters
      end
    end
  end
end
