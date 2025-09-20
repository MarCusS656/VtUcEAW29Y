# 代码生成时间: 2025-09-20 18:28:13
# math_calculator.rb
# This is a simple math calculator class using Ruby.

class MathCalculator
  # Adds two numbers and returns the result
  def add(a, b)
    raise ArgumentError, 'Both arguments must be numbers' unless a.is_a?(Numeric) && b.is_a?(Numeric)
    a + b
  end

  # Subtracts b from a and returns the result
  def subtract(a, b)
    raise ArgumentError, 'Both arguments must be numbers' unless a.is_a?(Numeric) && b.is_a?(Numeric)
    a - b
  end

  # Multiplies two numbers and returns the result
  def multiply(a, b)
    raise ArgumentError, 'Both arguments must be numbers' unless a.is_a?(Numeric) && b.is_a?(Numeric)
    a * b
  end

  # Divides a by b and returns the result
  def divide(a, b)
    raise ArgumentError, 'Both arguments must be numbers' unless a.is_a?(Numeric) && b.is_a?(Numeric)
    raise ZeroDivisionError, 'Cannot divide by zero' if b == 0
    a.to_f / b.to_f
  end
end

# Example usage of the MathCalculator
if __FILE__ == $0
  calculator = MathCalculator.new
  puts 'Enter two numbers to perform calculations:'
  a = gets.to_f
  b = gets.to_f

  puts "Addition: #{calculator.add(a, b)}"
  puts "Subtraction: #{calculator.subtract(a, b)}"
  puts "Multiplication: #{calculator.multiply(a, b)}"
  puts "Division: #{calculator.divide(a, b)}"
end