require "string_calculator"

describe StringCalculator do
  describe ".add" do
    context "for empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context "for single number" do
      it "returns the number itself" do
        expect(StringCalculator.add("1")).to eq(1)
        expect(StringCalculator.add("5")).to eq(5)
        expect(StringCalculator.add("10")).to eq(10)
        expect(StringCalculator.add("15")).to eq(15)
      end
    end
  end
end