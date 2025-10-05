# 代码生成时间: 2025-10-06 03:20:24
#
# File: option_pricing.rb
# Provides a basic implementation of the Black-Scholes model for option pricing.
#
# @author Your Name
# @date 2023-04-05
#

require 'mathn'

# The OptionPricing module encapsulates the Black-Scholes model.
module OptionPricing
  #
  # Calculates the price of a European call or put option using the Black-Scholes model.
  #
  # @param [Symbol] type 'call' or 'put' option type
  # @param [Float] s current stock price
  # @param [Float] k strike price
  # @param [Float] t time to maturity in years
  # @param [Float] r risk-free interest rate (as a decimal)
  # @param [Float] sigma volatility of the stock returns
  #
  # @return [Float] the theoretical price of the option
  #
  def self.black_scholes(type, s, k, t, r, sigma)
    unless type == :call || type == :put
      raise 'Invalid option type. Must be :call or :put.'
    end

    # Calculate d1 and d2
    d1 = (Math.log(s / k) + (r + sigma**2 / 2) * t) / (sigma * Math.sqrt(t))
    d2 = d1 - sigma * Math.sqrt(t)

    # Calculate the Black-Scholes formula
    price = type == :call ? s * cumulative_distribution(d1) - k * Math.exp(-r * t) * cumulative_distribution(d2) :
                         k * Math.exp(-r * t) * (1 - cumulative_distribution(d2)) - s * (1 - cumulative_distribution(d1))
  
    # Return the price
    price
  end

  #
  # Calculates the cumulative distribution function of the standard normal distribution.
  #
  # @param [Float] x the value at which to calculate the cumulative distribution
  #
  # @return [Float] the cumulative distribution value
  #
  def self.cumulative_distribution(x)
    (1 + x.erf / (Math.sqrt(2) * Math.sqrt(2))) * 0.5
  end
end

# Example usage:
begin
  s, k, t, r, sigma = 100.0, 105.0, 0.5, 0.06, 0.2
  call_price = OptionPricing.black_scholes(:call, s, k, t, r, sigma)
  put_price = OptionPricing.black_scholes(:put, s, k, t, r, sigma)
  puts "Call option price: #{call_price}"
  puts "Put option price: #{put_price}"
rescue => e
  puts "An error occurred: #{e.message}"
end