module Hangman
  module Strategies
    module Utils
      class WordPattern
        MYSTERY_LETTER = '-'

        def self.match_pattern(guessed, exclusions)
          new(guessed, exclusions).pattern
        end

        attr_reader :guessed, :exclusions

        def initialize(guessed, exclusions)
          @guessed, @exclusions = guessed, exclusions
        end

        def pattern
          Regexp.new("\\A#{match_pattern}\\z", true)
        end

        private

        def match_pattern
          if exclusions.empty?
            "[A-Z]{#{guessed.size}}"
          else
            guessed.gsub(MYSTERY_LETTER, "[^#{excluded_letters}]")
          end
        end

        def excluded_letters
          exclusions.join
        end
      end
    end
  end
end
