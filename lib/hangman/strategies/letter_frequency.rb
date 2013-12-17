require 'hangman/strategies/utils/word_pattern'

module Hangman
  module Strategies
    class LetterFrequency
      attr_reader :game, :dictionary

      def initialize(game, words)
        @game = game
        @dictionary = Dictionary::Filter.new(words)
      end

      def next_guess!
        filter!

        if guess_word?
          game.guess_word(word)
        else
          game.guess_letter(letter)
        end
      end

      private

      def filter!
        dictionary.filter!(pattern)
      end

      def guess_word?
        dictionary.words.size > 0 && dictionary.words.size <= 2
      end

      def word
        dictionary.shift_word
      end

      def letter
        remain_letters.first || EnglishPopularity.new(game).letter
      end

      def remain_letters
        dictionary.letters - game.all_guessed_letters
      end

      def pattern
        Utils::WordPattern.match_pattern(game.guessed, game.all_guessed_letters)
      end
    end
  end
end
