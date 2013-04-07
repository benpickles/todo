module Todo
  class List
    include Enumerable

    attr_reader :items

    def initialize
      @items = []
    end

    def <<(item)
      item = Item.new(item.to_s) unless Item === item
      items << item
    end

    def delete(thing_to_delete)
      case thing_to_delete
      when Integer
        delete_at(thing_to_delete)
      when Item
        delete_item(thing_to_delete)
      else
        delete_text(thing_to_delete)
      end
    end

    def delete_at(index)
      items.delete_at(index)
    end

    def delete_item(item_to_delete)
      items.delete_if do |item|
        item == item_to_delete
      end
    end

    def delete_text(text)
      items.delete_if do |item|
        item.text == text
      end
    end

    def each
      items.each do |item|
        yield item
      end
    end

    def size
      items.size
    end
  end
end
