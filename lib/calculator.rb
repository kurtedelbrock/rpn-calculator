class Calculator
  def self.calculate_pair(first_operand, second_operand, operator)
    first_operand.send operator, second_operand.to_f
  end

  def self.calculate(initial, tail, operators)
    tail.zip(operators).inject(initial) do |memo, pair|
      self.calculate_pair(memo, pair.first, pair.last)
    end
  end
end
