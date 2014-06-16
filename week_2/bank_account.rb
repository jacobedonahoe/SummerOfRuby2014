class BankAccount
  def to_s
    self.balance.to_s
  end

  def balance
    puts %Q{The account "#{account.name}" has a balance of  $#{account.balance}.}
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

  def name=(new_name)
    @name = new_name
  end

  def history
    puts %Q{History for account "TestAccount:"}
    @transactions.each do |transaction|
      transaction.each do |key, value|
        puts %Q{#{key} of $#{value}}
      end
    end
    puts %Q{The account #{@name} has a balance of $#{@balance}}
  end

  def name
    @name
  end
end


account = BankAccount.new
account.deposit 20
account.deposit 20
account.name= "TestAccount"



