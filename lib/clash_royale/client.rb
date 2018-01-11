# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'clash_royale/auth_header'

module ClashRoyale
  class Client
    BASE_URL = 'https://api.cr-api.com/'

    attr_accessor :conn

    def initialize(token:)
      @conn = Faraday.new(url: BASE_URL) do |conn|
        conn.request :json
        # conn.use Faraday::Response::Logger
        conn.use ClashRoyale::AuthHeader, token
        conn.adapter Faraday.default_adapter
      end
    end

    def get(options)
      conn.get(options)
    end
  end
end
