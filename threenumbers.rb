answer = 0
puts "this program adds three numbers together."
puts "what is the first number?"
number_1 = gets.chop
puts "what is the second number?"
number_2 = gets.chop
puts "what is the third number?"
number_3 = gets.chop

number_1 = number_1.to_i
number_2 = number_2.to_i
number_3 = number_3.to_i

answer = number_1 + number_2 + number_3

puts "the result of #{number_1} plus #{number_2} plus #{number_3} is #{answer}"
