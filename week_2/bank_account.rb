class BankAccount
  def to_s
    self.balance.to_s
  end

  def balance
    @balance
  end

  def deposit(amount)
    @balance = 0 if @balance.nil?
    @balance += amount
    @transaction = {type: "deposit", amount: amount}
    @transactions << @transaction
  end

  def init
    @balance = 0
    @transactions = [:type,:amount]
  end

  def withdraw(amount)
    @balance -= amount
    @transaction = {type: "withdrawl", amount: amount}
    @transactions << @transaction
  end

  def name=(new_name)
    @name = new_name
  end

  def name
    @name
  end
end


account = BankAccount.new
account.deposit 20
account.deposit 20
account.name= "TestAccount"

puts %Q{The account "#{account.name}" has a balance of  $#{account.balance}.}


