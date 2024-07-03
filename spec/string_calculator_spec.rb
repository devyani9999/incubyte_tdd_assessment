require "string_calculator"

describe StringCalculator do
  describe ".add" do
    context "for empty string" do
      it "returns 0" do
        result =  StringCalculator.add("")
        expect(result).to eq(0)
      end
    end
  end
end