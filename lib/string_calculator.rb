# frozen_string_literal: true

class StringCalculator
  def self.add(input)
    input.strip!
    if input.empty?
      return 0
    elsif input.start_with?("//")
      input = input.split("\n")
      delimiter = input[0][-1]
      numbers = input[1]
      numbers = numbers.split(delimiter).map(&:to_i)
      return numbers.sum
    else
      input = input.split(/[,\n]/).map(&:to_i)
      return input.sum
    end
  end

end
