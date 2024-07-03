# frozen_string_literal: true

class StringCalculator
  def self.add(input)
    if input.empty?
      return 0
    else
      input = input.split(",").map(&:to_i)
      if input.size > 1
        return input[0] + input[1]
      else
        return input[0]
      end
    end
  end
end
