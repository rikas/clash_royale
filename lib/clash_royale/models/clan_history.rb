# frozen_string_literal: true

module ClashRoyale
  class ClanHistory
    def self.find(code)
      response = ClashRoyale.client.get("/clans/#{code}/history")

      json = JSON.parse(response.body)

      new(json)
    end

    def initialize(json)
      puts json.inspect
    end
  end
end
