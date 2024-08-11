# frozen_string_literal: true

require_relative "http_wrapper/version"
require 'faraday'
require 'oj'

module HttpWrapper
  class Error < StandardError; end
  
  class HttpWrapper
    def initialize(base_url)
      @connection = Faraday.new(url: base_url) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter :http
      end
    end
  
    def get(endpoint, params = {})
      response = @connection.get(endpoint, params)
      handle_response(response)
    end
  
    def post(endpoint, payload = {})
      response = @connection.post(endpoint, payload)
      handle_response(response)
    end
  
    private
  
    def handle_response(response)
      if response.success?
        Oj.load(response.body)
      else
        raise "Error: #{response.status} - #{response.body}"
      end
    rescue Faraday::Error => e
      raise "HTTP Request failed: #{e.message}"
    end
  end
end
