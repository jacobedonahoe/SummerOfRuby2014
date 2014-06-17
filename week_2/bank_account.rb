module Interest
  def calculate_interest(rate)
    calculateInterestResult = self.balance * (rate.to_f/100)
    %Q{at the rate of %#{rate}, this account will earn
       #{calculateInterestResult} in one year}
  end
end

class BankAccount
  include Interest
  attr_accessor :name
  attr_reader :balance

  def self.newS_with_name(starting_name)
    account = BankAccount.new
    account.name = starting_name
    account
  end

  def to_s
    self.balance.to_s
  end

  def deposit(amount)
    raise WrongDataTypeForDepositError unless amount.is_a? Numeric
    @balance = 0 if @balance.nil?
    @balance += amount
    transaction = {type: "deposit", amount: amount}
    @transactions << transaction
  end

  def initialize(starting_balance = 0, starting_name = "")
    @balance = starting_balance
    @name = starting_name
    @transactions = []
  end

  def withdraw(amount)
    raise WrongDataTypeForDepositError unless amount.is_a? Numeric
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

class WrongDataTypeForWithdrawlError < StandardError
  def to_s
    "The withdrawl amount must be a number."
  end
end

class WrongDataTypeForDepositError < StandardError
  def to_s
    "The deposit amount must be a number."
  end
end

account = BankAccount.new_with_name("Jacob's Savings Account")
account.deposit 20
account.deposit 20
account.history

puts account.history
puts account.calculate_interest(15.0)
