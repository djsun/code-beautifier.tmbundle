module RBeautify

  class Language

    @@languages = {}

    attr_accessor :matchers, :indent_size

    class << self

      def language(name)
        languages[name]
      end

      def languages
        @@languages
      end

      def add_language(name)
        languages[name] = new()
      end
    end

    def initialize
      self.matchers = []
    end

    def add_matcher(name, starts, ends, options = {})
      self.matchers << BlockMatcher.new(self, name, starts, ends, options)
    end

    def matcher(name)
      self.matchers.detect { |matcher| matcher.name == name}
    end

  end

end
