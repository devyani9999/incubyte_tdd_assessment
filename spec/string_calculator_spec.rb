require "string_calculator"

describe StringCalculator do
  describe ".add" do
    let(:string_calculator) { StringCalculator.new }

    context "for empty string" do
      it "returns 0" do
        expect(string_calculator.add("")).to eq(0)
      end
    end

    context "for single number" do
      it "returns the number itself" do
        expect(string_calculator.add("1")).to eq(1)
        expect(string_calculator.add("5")).to eq(5)
        expect(string_calculator.add("10")).to eq(10)
        expect(string_calculator.add("15")).to eq(15)
      end
    end

    context "for two numbers" do
      it "returns the sum of two numbers" do
        expect(string_calculator.add("1,5")).to eq(6)
        expect(string_calculator.add("5,2")).to eq(7)
        expect(string_calculator.add("10,3")).to eq(13)
        expect(string_calculator.add("15,4")).to eq(19)
      end
    end

    context "for multiple numbers" do
      it "returns the sum of all the numbers" do
        expect(string_calculator.add("1,5,6,7")).to eq(19)
        expect(string_calculator.add("5,2,5,6")).to eq(18)
        expect(string_calculator.add("10,3,2,3")).to eq(18)
        expect(string_calculator.add("15,4,8,9")).to eq(36)
      end
    end

    context "for multiple numbers with , and '\\n'" do
      it "returns the sum of all the numbers" do
        expect(string_calculator.add("1\n2,3")).to eq(6)
        expect(string_calculator.add("5,2\n5\n6")).to eq(18)
        expect(string_calculator.add("10,3\n2,3")).to eq(18)
        expect(string_calculator.add("15\n4\n8\n9")).to eq(36)
      end
    end

    context "for multiple numbers with delimiter and numbers separated by \\n: '//[delimiter]\\n[numbers…]'" do
      it "returns the sum of all the numbers" do
        expect(string_calculator.add("//;\n1;2")).to eq(3)
        expect(string_calculator.add("//:\n2:3:4")).to eq(9)
      end
    end

  end
end