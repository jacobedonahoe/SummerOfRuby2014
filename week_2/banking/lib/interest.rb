module Interest
  def calculate_interest(rate)
    calculateInterestResult = self.balance * (rate.to_f/100)
    %Q{at the rate of %#{rate}, this account will earn
       #{calculateInterestResult} in one year}
  end
end

