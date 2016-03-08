require_relative '../lib/calculator.rb'

describe Calculator do
  describe '::calculate_pair' do
    context 'with 3 and 4 as operands' do
      let(:first_operand) { 3 }
      let(:second_operand) { 4 }

      it 'should be able to add' do
        expect(Calculator.calculate_pair(first_operand, second_operand, :+)).to eq(7)
      end

      it 'should be able to subtract' do
        expect(Calculator.calculate_pair(first_operand, second_operand, :-)).to eq(-1)
      end

      it 'should be able to multiply' do
        expect(Calculator.calculate_pair(first_operand, second_operand, :*)).to eq(12)
      end

      it 'should be able to divide' do
        expect(Calculator.calculate_pair(first_operand, second_operand, :/)).to eq(0.75)
      end

    end
  end

  describe '::calculate' do
    context 'with the input (2 3 4 5 + - *)' do
      let(:initial) { 2 }
      let(:tail) { [3, 4, 5] }
      let(:operators) { [:+, :-, :*] }

      it 'should calculate the correct output' do
        expect(Calculator.calculate(initial, tail, operators)).to eq(5)
      end
    end

    context 'with input that requires dividing by zero' do
      let(:initial) { 2 }
      let(:tail) { [0] }
      let(:operators) { [:/] }

      it 'should raise a ZeroDivisionError exception' do
        expect{ Calculator.calculate(initial, tail, operators) }.to raise_error(ZeroDivisionError)
      end
    end
  end
end
