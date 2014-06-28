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
