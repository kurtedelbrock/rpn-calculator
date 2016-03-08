require_relative '../calculator.rb'

describe CalculatorApp do
  let(:app) { CalculatorApp.new }
  describe "#add" do
    context 'with a number' do
      it 'should store it to the operands array' do
        app.add 2
        expect(app.operands).to include(2)
      end
    end
    context 'with a operator' do
      it 'should store it to the operators array' do
        app.add "*"
        expect(app.operators).to include(:*)
      end
    end
  end
end
