module Hangman
  module Player
    class Runner
      attr_reader :options, :stats

      def initialize(argv = ARGV)
        @options = Options.new(argv)
      end

      def run!
        dictionary = Dictionary.read_file(options.dictionary)

        if options.random && options.words.empty?
          options.words = dictionary.sample(options.random)
        end

        Stats.benchmark do |bm|
          options.words.each do |word|
            guesser = Guesser.new(word: word,
                                  max_wrong_guesses: options.max_wrong_guesses,
                                  dictionary: dictionary)

            bm.report(word: word) { guesser.guess! }
          end
        end
      end
    end
  end
end
