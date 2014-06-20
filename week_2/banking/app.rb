require_relative 'lib/logger'
require_relative 'lib/exceptions'
require_relative 'lib/bank_account'

account = BankAccount.new

keep_going = true

while keep_going do

  puts %Q{Would you like to make a Deposit ora Withdrawl? ("d" or "w")}
  transaction = gets.chop

  puts "What is the transaction amount?(Numeric with no dollar sign please)"
  amount = gets.chop

  if transaction == "d"
    account.deposit amount
  else 
    account.withdraw amount
  end

  puts "Your new balance is #{account.balance}"
  
  puts %Q{More transactinos? ("y" to continue)}

  keep_going = gets.chop == "y" || gets.chop == "Y"
end
puts "Thank you!"

