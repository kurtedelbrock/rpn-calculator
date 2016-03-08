class Calculator
  def self.calculate_pair(first_operand, second_operand, operator)
    first_operand.send operator, second_operand.to_f
  end
end
