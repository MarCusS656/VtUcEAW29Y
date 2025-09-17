# 代码生成时间: 2025-09-17 19:26:21
# http_request_handler.rb
# This file handles HTTP requests using the Ruby on Rails framework.

require 'rails/all'
require 'net/http'
require 'uri'

class HttpRequestHandler
  # Handles GET requests
  def self.get_request(url)
    uri = URI.parse(url)
    Net::HTTP.get_response(uri)
  rescue StandardError => e
    puts "Error making GET request: #{e.message}"
    nil
  end

  # Handles POST requests
  def self.post_request(url, params)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'
    request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    request.body = params.to_json
    response = http.request(request)
  rescue StandardError => e
    puts "Error making POST request: #{e.message}"
    nil
  else
    response
  end

  # Handles PUT requests
  def self.put_request(url, params)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'
    request = Net::HTTP::Put.new(uri, 'Content-Type' => 'application/json')
    request.body = params.to_json
    response = http.request(request)
  rescue StandardError => e
    puts "Error making PUT request: #{e.message}"
    nil
  else
    response
  end

  # Handles DELETE requests
  def self.delete_request(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'
    request = Net::HTTP::Delete.new(uri)
    response = http.request(request)
  rescue StandardError => e
    puts "Error making DELETE request: #{e.message}"
    nil
  else
    response
  end
end
