module Hangman
  module Strategies
    class EnglishPopularity
      ORDERING = 'ESIARNTOLCDUPMGHBYFVKWZXQJ'

      attr_reader :game, :letters

      def initialize(game)
        @game = game
        @letters = remain_letters
      end

      def next_guess!
        game.guess_letter(letter)
      end

      def letter
        letters.shift
      end

      private

      def remain_letters
        ORDERING.split(//) - game.all_guessed_letters
      end
    end
  end
end
