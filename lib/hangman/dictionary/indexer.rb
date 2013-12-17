module Hangman
  module Dictionary
    class Indexer
      attr_reader :storage

      def initialize
        @storage = Hash.new(0)
      end

      def index(word)
        uniq_letters(word).each { |letter| storage[letter] += 1 }
      end

      def ranked_letters
        sort_letters
      end

      def clear
        storage.clear
      end

      private

      def uniq_letters(word)
        word.split(//).uniq
      end

      def sort_letters
        storage.sort_by { |k, v| -v }.collect { |pair| pair.first }
      end
    end
  end
end
