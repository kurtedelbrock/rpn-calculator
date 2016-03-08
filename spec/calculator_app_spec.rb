require_relative '../lib/app.rb'

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

    context 'with input that is not a number or an operator' do
      it 'should raise an exception' do
        expect{ app.add "F" }.to raise_error CalculatorInvalidInputError
      end
    end

    context 'with a negative number' do
      it 'should store it to the operands array' do
        app.add "-3.423"
        expect(app.operands).to include(-3.423)
      end
    end

    context 'with a decimal' do
      it 'should store it to the operands array' do
        app.add "4.2"
      end
    end
  end

  describe "#finished?" do
    context "with no operands or operators" do
      it 'should be false' do
        expect(app.finished?).to be(false)
      end
    end

    context "with the same number of operands and operators" do
      it 'should be false' do
        app.operators = [:+, :+]
        app.operands = [1, 2]
        expect(app.finished?).to be(false)
      end
    end

    context 'with 2 3 + + +' do
      it 'should be false' do
        app.operators = [:+, :+, :+]
        app.operands = [2, 3]
        expect(app.finished?).to be(false)
      end
    end

    context 'with 2 3 4 + +' do
      it 'should be true' do
        app.operators = [:+, :+]
        app.operands = [2, 3, 4]
        expect(app.finished?).to be(true)
      end
    end
  end

  describe "#initial" do
    context 'with the operands 3, 4, 5, 6' do
      it 'should return 3' do
        app.operands = [3, 4, 5, 6]
        expect(app.initial).to be(3)
      end
    end
  end

  describe "#tail" do
    context 'with the operands 3, 4, 5, 6' do
      it 'should return 4, 5 and 6' do
        app.operands = [3, 4, 5, 6]
        expect(app.tail).to eq([4, 5, 6])
      end
    end
  end

  describe "#clear" do
    before :each do
      app.operators = [:+]
      app.operands = [3]
      app.clear
    end

    it 'should reset the operators' do
      expect(app.operators).to eq([])
    end

    it 'should reset the operands' do
      expect(app.operands).to eq([])
    end
  end

end
