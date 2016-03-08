require_relative 'lib/calculator.rb'

class CalculatorInvalidInputError < StandardError
  def initialize(msg='Input must be a number or an operator.')
    super
  end
end

class CalculatorApp
  attr_accessor :operands
  attr_accessor :operators
  attr_accessor :operator_regex

  def initialize
    @operands = []
    @operators = []
    @operator_regex = /[\+\-\*\/]/
  end

  def add(input)
    valid_input? input
    sort! input
  end

  def sort!(input)
    input =~ @operator_regex ? @operators << input.to_sym : @operands << input
  end

  def valid_input?(input)
    raise CalculatorInvalidInputError unless input =~ @operator_regex or input.is_a? Numeric
  end
end
