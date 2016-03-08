require_relative '../lib/calculator.rb'
require 'readline'

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
    @operator_regex = /[\+\-\*\/]$/
  end

  def add(input)
    valid_input? input
    sort! input
  end

  def sort!(input)
    input =~ @operator_regex ? @operators << input.to_sym : @operands << input.to_f
  end

  def valid_input?(input)
    raise CalculatorInvalidInputError unless input =~ @operator_regex or is_number? input
  end

  def finished?
    @operands.count != 0 && @operators.count != 0 && @operators.count == @operands.count-1
  end

  def initial
    @operands.first
  end

  def tail
    @operands.drop(1)
  end

  def clear
    @operands = []
    @operators = []
  end

  def is_number? string
    true if Float(string) rescue false
  end

  def begin
    loop do
      begin
        input = Readline.readline(">> ")

        break if input == "q"

        add(input)

        if finished?
          output = Calculator.calculate(initial, tail, @operators)
          clear
          @operands = [output]
          puts "= #{output}"
        end

        puts "### #{@operands}\n### #{@operators}"
      rescue ZeroDivisionError
        puts "Cannot divide by zero. Clearing previous input."
        clear
      rescue CalculatorInvalidInputError => error
        puts error.message
      end

    end
  end
end
