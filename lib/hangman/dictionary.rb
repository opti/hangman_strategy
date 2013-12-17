require 'set'
require 'hangman/dictionary/filter'
require 'hangman/dictionary/indexer'
require 'hangman/dictionary/reader'
require 'hangman/dictionary/storage'

module Hangman
  module Dictionary

    def self.read_file(file_path)
      Reader.new(file_path).read!
    end

  end
end
