module Hangman
  module Dictionary
    class Reader
      attr_reader :file_path, :storage

      def initialize(file_path)
        @file_path = file_path
        @storage   = Storage.new
      end

      def read!
        File.readlines(file_path).each do |line|
          storage.add(line)
        end

        storage
      end
    end
  end
end
