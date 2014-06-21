class Cart
  attr_accessor :name
  attr_reader :total, :inventory
  
  def initialize
    self.name = "test cart"
  end
end;

cart = Cart.new
puts cart.name
