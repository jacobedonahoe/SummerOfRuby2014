def is_it_even(input_number)
  input_number % 2 === 0
end

puts "this program will tell you if your number is even."
puts "please enter your number."
number = gets.chop
number = number.to_i

puts is_it_even(number)

