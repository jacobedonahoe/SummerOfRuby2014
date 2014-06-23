require relative "money_helper"

class Cart
  attr_reader :items

  def initialize
    items = []
  end

  def add_to_cart(item) 
    index = self.items.find_index{|entry| entry[:item]== item}

    if index
      items[index][:quantity] += 1
    else
      items << {:item => item, :quantity => 1
    end
  end

  def summary
    self.items.collet{|item|
      "Item : #{item[:item].name} @#{format_currency(item[item].price)} x #{item[:quantity]}"
    }.join("\n")
  end

  def total
    total = self.items.reduce(0){|total,current|total += current[:item].price * current[:quantity] }
    format_currency(total)
  end
end
