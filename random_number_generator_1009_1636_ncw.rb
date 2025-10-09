# 代码生成时间: 2025-10-09 16:36:53
# RandomNumberGenerator.rb
# This class generates random numbers in a specified range.

class RandomNumberGenerator
  # Initialize with a minimum and maximum value for the random number range.
  # @param min [Integer] the minimum value of the range
  # @param max [Integer] the maximum value of the range
  def initialize(min, max)
    # Ensure the min and max values are integers and min is less than max
    unless min.is_a?(Integer) && max.is_a?(Integer) && min < max
      raise ArgumentError, "Please provide integer values for min and max with min < max."
    end
    @min = min
    @max = max
  end

  # Generate a random number within the initialized range.
  # @return [Integer] a random number between min and max
  def generate
    rand(@min..@max)
  end
end

# Example usage:
# generator = RandomNumberGenerator.new(1, 100)
# puts generator.generate