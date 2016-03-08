require_relative 'lib/calculator.rb'

class CalculatorApp
  attr_accessor :operands
  attr_accessor :operators

  def initialize
    @operands = []
    @operators = []
  end

  def add(input)
    input =~ /[\+\-\*\/]/ ? @operators << input.to_sym : @operands << input
  end
end
