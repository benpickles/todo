module Todo
  class Item
    attr_reader :text

    def initialize(text)
      @text = text
    end
  end
end
