module Zenzai
  class JewelPresenter
    def initialize(jewel)
      @jewel = jewel
    end

    %w(id source citation quote comment).each do |name|
      define_method(name.to_sym) do
        @jewel.send(name.to_sym)
      end
    end

    def trim_citation(length)
      trim_string(@jewel.citation, length)
    end

    def trim_quote(length)
      trim_string(@jewel.quote, length)
    end

    def trim_comment(length)
      trim_string(@jewel.comment, length)
    end

    def html_quote
      @jewel.quote.gsub("\u2028", "<br>").html_safe
    end

    private

    def trim_string(string, length)
      string.slice(0, length)
    end

    attr_accessor :jewel
  end
end
