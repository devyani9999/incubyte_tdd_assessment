# frozen_string_literal: true

class StringCalculator
  def add(input)
    input.strip!
    if input.empty?
      0
    else
      @sanitized_numbers, @delimiters = get_sanitized_numbers_and_delimiters(input)
      throw_exception_for_negatives
      reject_numbers_bigger_than_1000
      calculate_result
    end
  end

  private

  PRODUCT_DELIMITER = "*"

  def calculate_result
    if @delimiters == PRODUCT_DELIMITER
      @sanitized_numbers.inject(&:*)
    else
      @sanitized_numbers.sum
    end
  end

  def custom_delimiter?(input)
    input.start_with?("//")
  end

  def get_sanitized_numbers_and_delimiters(input)
    delimiters = /[,\n]/
    if custom_delimiter?(input)
      numbers, delimiters = custom_numbers_and_delimiters(input)
    else
      numbers = input.split(delimiters)
    end

    [numbers.map(&:to_i), delimiters]
  end

  def custom_numbers_and_delimiters(input)
    input = input.split("\n")
    delimiters = custom_delimiter(input[0])

    [input[1].split(delimiters), delimiters]
  end

  def custom_delimiter(input)
    if input.include?("[") && input.include?("]")
      delimiters = input.scan(/(?<=\[).+?(?=\])/)
      /[#{delimiters.join(",")}]/ # return in format /[d1,d2]/
    else
      input[-1]
    end
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
