require 'java'
$CLASSPATH << File.expand_path('../../../target/classes', __FILE__)
require 'forwardable'

module Hangman
  java_import 'HangmanGame'

  class Game
    extend Forwardable

    attr_reader :game

    def initialize(word, max_wrong_guesses)
      @game = HangmanGame.new(word, max_wrong_guesses)
    end

    # Delegate methods to the instance of the java class
    def_delegator :@game, :guessedSoFar,        :guessed
    def_delegator :@game, :currentScore,        :current_score
    def_delegator :@game, :guessWord,           :guess_word
    def_delegator :@game, :getSecretWordLength, :word_length

    def guess_letter(letter)
      # ruby has no such thing as Char, so it has to be
      # transformed before passing to the java method
      char = letter[0].ord.to_java :char
      game.guessLetter(char)
    end

    def in_progress?
      game.gameStatus == HangmanGame::Status::KEEP_GUESSING
    end

    def correctly_guessed_letters
      game.correctlyGuessedLetters.to_a.map(&:chr)
    end

    def incorrectly_guessed_letters
      game.incorrectlyGuessedLetters.to_a.map(&:chr)
    end

    def all_guessed_letters
      game.getAllGuessedLetters.to_a.map(&:chr)
    end
  end
end
