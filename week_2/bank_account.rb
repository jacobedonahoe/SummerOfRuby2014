module Interest
  def calculateInterest(rate, balance)
    calculateInterestResult = balance * (rate/100)
    "at the rate of %#{rate}, this account will earn #{calculateInterestResult} 
    in one year"
  end
end


class BankAccount
  include Interest
  attr_accessor :name
  attr_reader :balance

  def to_s
    self.balance.to_s
  end

  def interest(rate)
    calculateInterest(rate, self.balance)
  end

  def deposit(amount)
    @balance = 0 if @balance.nil?
    @balance += amount
    transaction = {type: "deposit", amount: amount}
    @transactions << transaction
  end

  def initialize
    @balance = 0
    @transactions = []
  end

  def withdraw(amount)
    @balance -= amount
    transaction = {type: "withdrawl", amount: amount}
    @transactions << transaction
  end

  def history
    output = @transactions.collect do |transaction|
      "#{transaction[:type]} of $#{transaction[:amount]}"
    end

    banner = %Q{History for account "TestAccount:"\n}
    banner << output.join("\n")
    banner << %Q{\nThe account "#{@name}" has a balance of $#{@balance}}
  end

  def summary
  end

end


account = BankAccount.new
account.deposit 20
account.deposit 20
account.name= "TestAccount"
account.history

puts account.history
puts account.interest(15)
