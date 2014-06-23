class Item
  attr_reader :name, :price

  def initialize(name, price)
    @name = name || ""
    @price = price || 0.0
  end
end
