require_relative "lib/cart.rb"
require_relative "lib/item.rb"
require_relative "lib/money_helper.rb"

include MoneyHelper

cart = Cart.new

items = [
  {"a" => Item.new("apple",1.00)},
  {"b" => Item.new("banana",1.00)},
  {"c" => Item.new("carrot",0.50)},
]

keep_going = true

def display_menu(items)
  puts "Items Available:"
  puts "-" * 10

  items.each do |choice, item|
    puts "#{choice} #{item.name} (#{format_currency(item.price)})"
  end
end

while keep_going
  puts "Choose an item"

  display_menu(items)

  choice = gets.chop

  if items.has_key?(choice)
    cart.add_to_cart(items[choice])
  else
    puts "That's not a valid option"
  end

  puts cart.summary

  puts "More Items? (y or n)"

  keep_going = gets.chop.downcase == "y"
end

puts cart.total

puts "Thank you for shopping!"
