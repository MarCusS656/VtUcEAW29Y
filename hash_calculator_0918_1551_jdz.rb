# 代码生成时间: 2025-09-18 15:51:18
# hash_calculator.rb
# A simple Ruby on Rails application that calculates hash values for input strings.

require 'digest'

class HashCalculator
  # Calculate the SHA-256 hash of a given string
  #
  # @param input [String] the string to be hashed
  # @return [String] the SHA-256 hash of the input string
  def self.sha256(input)
    # Check if the input is a valid string
    raise ArgumentError, 'Input must be a string' unless input.is_a?(String)

    # Calculate the SHA-256 hash
    Digest::SHA256.hexdigest(input)
  end

  # Calculate the MD5 hash of a given string
  #
  # @param input [String] the string to be hashed
  # @return [String] the MD5 hash of the input string
  def self.md5(input)
    # Check if the input is a valid string
    raise ArgumentError, 'Input must be a string' unless input.is_a?(String)

    # Calculate the MD5 hash
    Digest::MD5.hexdigest(input)
  end
end

# Example usage
if __FILE__ == $0
  puts 'Enter a string to calculate its SHA-256 hash:'
  input = gets.chomp
  puts "SHA-256 Hash: #{HashCalculator.sha256(input)}"

  puts 'Enter a string to calculate its MD5 hash:'
  input = gets.chomp
  puts "MD5 Hash: #{HashCalculator.md5(input)}"
end