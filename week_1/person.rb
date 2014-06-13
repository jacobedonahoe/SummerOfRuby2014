keeplooping = true
people = []
while(keeplooping) do
  puts "please enter the first name of your person."
  first_name = gets.chop
  puts "please enter the last name of your person."
  last_name = gets.chop
  puts "please enter the age of your person."
  age = gets.chop
  full_name = "#{first_name} #{last_name}"

  person = {"name" => full_name, "age" => age}

  people << person
  puts "would you like to add another person? yes/no"
  if gets.chop == "no"
    keeplooping = false
  end
end
puts "The number of people you have entered is #{people.length}"
people.each do |person| 
  person.each do|key, value|
    puts "#{key}: #{value}" 
    puts ""
  end
end
puts "All done!"
  

