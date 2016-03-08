class CalculatorDivideByZero < StandardError
  def initialize(msg='It is not possible to divide by zero. Clearing previous input...')
    super
  end
end

module Calculator
  def self.calculate_pair(first_operand, second_operand, operator)
    first_operand.send operator, second_operand.to_f
  end

  def self.calculate(initial, tail, operators)
    val = tail.zip(operators).inject(initial) do |memo, pair|
      self.calculate_pair(memo, pair.first, pair.last)
    end

    raise ZeroDivisionError if val == Float::INFINITY
    val
  end
end
