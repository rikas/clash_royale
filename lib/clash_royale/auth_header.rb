# frozen_string_literal: true

require 'faraday'

module ClashRoyale
  # A Faraday middleware to send the token authentication using a custom header as specified here:
  # http://docs.cr-api.com/#/authentication
  class AuthHeader < Faraday::Middleware
    attr_accessor :token

    def initialize(app, token)
      super(app)

      @token = token
    end

    def call(env)
      return @app.call(env) if token.nil?

      env[:request_headers]['auth'] = token

      @app.call(env)
    end
  end
end
