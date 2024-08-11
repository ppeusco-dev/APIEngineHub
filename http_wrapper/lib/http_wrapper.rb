# frozen_string_literal: true

require_relative "http_wrapper/version"
require 'faraday'
require 'oj'
require 'httpx/adapters/faraday'

module HttpWrapper
  class Client
    def initialize(base_url)
      @connection = Faraday.new(url: base_url) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter :httpx
      end
    end

    def get(endpoint, params = {})
      @connection.get(endpoint, params)
    end

    def post(endpoint, payload = {})
      @connection.post(endpoint, payload)
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


