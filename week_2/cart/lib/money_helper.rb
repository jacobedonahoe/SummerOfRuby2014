module MoneyHelper
  private
    def format_currency(amount, type = "$")
      sprintf(type + "%.2f", amount)
    end
end
