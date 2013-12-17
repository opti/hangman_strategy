require 'optparse'

module Hangman
  module Player
    class Options
      DEFAULT_DICTIONARY = File.expand_path('../../../../dict/words.txt', __FILE__)
      DEFAULT_MAX_WRONG_GUESSES = 5

      attr_reader :dictionary, :max_wrong_guesses, :random
      attr_accessor :words

      def initialize(argv)
        @dictionary = DEFAULT_DICTIONARY
        @max_wrong_guesses = DEFAULT_MAX_WRONG_GUESSES
        parse(argv)
        @words = argv
      end

      private

      def parse(argv)
        opts = OptionParser.new do |options|
          options.banner = 'Guessing strategy for Hangman game.'

          options.separator ''
          options.separator '  Usage:'
          options.separator '    bin/strategy [options] word [word]'

          options.separator ''
          options.separator '  Options:'

          options.on('-d', '--dict path', String, "Full path of the dictionary file (assuming one word per line in the file).",
                                                  "By default will be used this dictionary: #{DEFAULT_DICTIONARY} ") do |option|
            @dictionary = option
          end

          options.on('-m', '--max-guesses 5', Integer, "Maximum wrong guesses allowed per game. Default is #{DEFAULT_MAX_WRONG_GUESSES}.") do |option|
            @max_wrong_guesses = option
          end

          options.on('-r', '--random 100', Integer, 'Play given number of random words') do |option|
            @random = option
          end

          options.on('-h', '--help', 'Show this messsage') do
            puts options
            exit
          end

          options.on('-v', '--version', 'Show version') do
            puts Hangman::VERSION
            exit
          end

          options.separator ''

          options.separator '  Examples:'
          options.separator '    bin/strategy -m 4 factual'
          options.separator '    bin/strategy -d /path/to/file factual'
          options.separator '    bin/strategy factual comaker'
          options.separator '    bin/strategy -r 1000'
          options.separator ''
        end

        begin
          argv = ['-h'] if argv.empty?
          opts.parse!(argv)
        rescue OptionParser::ParseError => e
          STDERR.puts e.message, "\n", opts
          exit(-1)
        end
      end
    end
  end
end
