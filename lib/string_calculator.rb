# frozen_string_literal: true

class StringCalculator
  def add(input)
    input.strip!
    if input.empty?
      0
    else
      @sanitized_numbers = get_sanitized_numbers(input)
      throw_exception_for_negatives
      reject_numbers_bigger_than_1000
      @sanitized_numbers.sum
    end
  end

  private

  def custom_delimiter?(input)
    input.start_with?("//")
  end

  def get_sanitized_numbers(input)
    delimiters = /[,\n]/
    if custom_delimiter?(input)
      numbers = custom_numbers(input)
    else
      numbers = input.split(delimiters)
    end

    numbers.map(&:to_i)
  end

  def custom_numbers(input)
    input = input.split("\n")
    delimiter = custom_delimiter(input[0])
    input[1].split(delimiter)
  end

  def custom_delimiter(input)
    input[-1]
  end

  def throw_exception_for_negatives
    if @sanitized_numbers.any?(&:negative?)
      negatives = @sanitized_numbers.find_all(&:negative?)
      raise Exception.new("Negative numbers not allowed: #{negatives.join(",")}")
    end
  end

  def reject_numbers_bigger_than_1000
    @sanitized_numbers.reject! { |num| num > 1000 }
  end
end
