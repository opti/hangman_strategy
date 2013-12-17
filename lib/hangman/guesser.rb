module Hangman
  class Guesser
    attr_reader :game, :strategy, :dictionary

    def initialize(args)
      word              = args.fetch(:word)
      max_wrong_guesses = args.fetch(:max_wrong_guesses)
      @dictionary       = args.fetch(:dictionary)

      @game     = Game.new(word, max_wrong_guesses)
      @strategy = begin
                    Strategies::LetterFrequency.new(game, words)
                  rescue KeyError
                    Strategies::EnglishPopularity.new(game)
                  end
    end

    def guess!
      while game.in_progress?
        strategy.next_guess!
      end

      game.current_score
    end

    private

    def words
      dictionary.fetch(game.word_length).dup
    end
  end
end
