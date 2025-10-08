# 代码生成时间: 2025-10-09 02:04:23
# data_desensitization.rb
# This Ruby script is a data desensitization tool.
# It provides a simple way to mask sensitive data in strings.

require 'active_support/all'

# DataDesensitizer module to encapsulate desensitization functionality.
module DataDesensitizer
  # Masks sensitive data in a string using a given mask character.
  # @param [String] data The string containing sensitive data to be masked.
  # @param [String] mask Character to use for masking.
  # @return [String] The string with sensitive data masked.
  def self.mask_data(data, mask = '*')
    raise ArgumentError, 'Data must be a string' unless data.is_a?(String)
    raise ArgumentError, 'Mask must be a single character string' unless mask.is_a?(String) && mask.length == 1

    # Define a list of patterns for common sensitive data types (e.g., email, phone number).
    patterns = {
      email: /(\w+)@(\w+)\.(\w+)/,
      phone: /(\+\d{1,3})?[-\s]?\d{3}[-\s]?\d{3}[-\s]?\d{4}/
    }

    # Define a method to replace matches with the mask character.
    def replace_match(match, mask)
      match[0].gsub(/[^\W\d_]/, mask)
    end

    # Apply masking to each pattern in the data string.
    patterns.each do |type, pattern|
      data = data.gsub(pattern) { replace_match Regexp.last_match, mask }
    end

    data
  end
end

# Example usage of the DataDesensitizer module.
if __FILE__ == $0
  sensitive_data = "John Doe <john.doe@example.com>, Phone: +1-234-567-8900"
  puts "Original data: #{sensitive_data}"
  desensitized_data = DataDesensitizer.mask_data(sensitive_data)
  puts "Desensitized data: #{desensitized_data}"
end