# frozen_string_literal: true

class StringCalculator
  def self.add(input)
    if input.empty?
      return 0
    else
      input = input.split(/[,\n]/).map(&:to_i)
      return input.sum
    end
  end
end
