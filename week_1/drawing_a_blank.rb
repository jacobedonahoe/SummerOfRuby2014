keepgoing = true
def is_it_even(input_number)
  input_number.to_i % 2 == 0
end
puts "enter something to keep going, enter a blank to stop."
while(keepgoing) do
  puts "what is your input?"
  input = gets.chop
  if input == ""
    keepgoing = false
  else
    if input.to_i.to_s == input
      if is_it_even(input)
        puts "your number is even"
      else
        puts "your number is odd"
      end
    else
      puts "your input is a string"
    end
  end
end
puts "all done!"
