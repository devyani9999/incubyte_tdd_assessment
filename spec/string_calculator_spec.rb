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

    context "for two numbers" do
      it "returns the sum of two numbers" do
        expect(StringCalculator.add("1,5")).to eq(6)
        expect(StringCalculator.add("5,2")).to eq(7)
        expect(StringCalculator.add("10,3")).to eq(13)
        expect(StringCalculator.add("15,4")).to eq(19)
      end
    end

    context "for multiple numbers" do
      it "returns the sum of all the numbers" do
        expect(StringCalculator.add("1,5,6,7")).to eq(19)
        expect(StringCalculator.add("5,2,5,6")).to eq(18)
        expect(StringCalculator.add("10,3,2,3")).to eq(18)
        expect(StringCalculator.add("15,4,8,9")).to eq(36)
      end
    end

    context "for multiple numbers with , and '\\n'" do
      it "returns the sum of all the numbers" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
        expect(StringCalculator.add("5,2\n5\n6")).to eq(18)
        expect(StringCalculator.add("10,3\n2,3")).to eq(18)
        expect(StringCalculator.add("15\n4\n8\n9")).to eq(36)
      end
    end
  end
end