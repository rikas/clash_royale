# frozen_string_literal: true

require 'clash_royale/version'
require 'clash_royale/client'
require 'clash_royale/models/clan'
require 'clash_royale/configuration'

module ClashRoyale
  extend ClashRoyale::Configuration

  def self.client
    @client ||= Client.new(token: token)
  end

  def self.api_version
    response = client.get('/version')
    response.body
  end
end
