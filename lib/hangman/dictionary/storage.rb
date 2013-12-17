module Hangman
  module Dictionary
    class Storage
      attr_reader :entries

      def initialize
        @entries = Hash.new { |hash, key| hash[key] = Set.new }
      end

      def add(value)
        value = normalize(value)
        entries[value.size].add(value)
        self
      end

      def fetch(key)
        entries.fetch(key)
      end

      def sample(n)
        entries.values.map(&:to_a).flatten.sample(n)
      end

      private

      def normalize(value)
        value.chomp.upcase
      end
    end
  end
end
