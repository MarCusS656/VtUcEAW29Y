# 代码生成时间: 2025-10-12 03:59:21
# api_response_formatter.rb
# This module provides a simple way to format API responses in a Rails application.

module ApiResponseFormatter
  # Formats a successful API response with a given status and data.
  #
  # @param status [Integer] The HTTP status code of the response.
  # @param data [Hash] The data to be included in the response.
  # @return [Hash] A formatted API response.
  def self.success(status, data)
    {
      status: status,
      data: data,
      errors: nil
    }
  end

  # Formats an API response with an error message.
  #
  # @param status [Integer] The HTTP status code of the response.
  # @param error [String] The error message to be included in the response.
  # @return [Hash] A formatted API response with an error.
  def self.error(status, error)
    {
      status: status,
      data: nil,
      errors: [error]
    }
  end

  # Wraps a controller action in a formatted response.
  #
  # @param controller [ActionController::Base] The controller instance.
  # @param block [Proc] A block that yields the result of the action.
  # @return [Hash] A formatted API response based on the action's result.
  def self.wrap(controller, &block)
    begin
      # Perform the action and check for errors.
      result = block.call
      if result.is_a?(StandardError)
        # If an error occurred, format it as an error response.
        self.error(controller.class::ERROR_STATUS, result.message)
      else
        # If successful, format the response with the result.
        self.success(controller.class::SUCCESS_STATUS, result)
      end
    rescue StandardError => e
      # Handle any unexpected errors and format them as error responses.
      self.error(500, e.message)
    end
  end
end