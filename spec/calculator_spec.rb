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
end
