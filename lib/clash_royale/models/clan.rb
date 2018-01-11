# frozen_string_literal: true

require 'clash_royale/model'
require 'clash_royale/models/clan_member'
require 'clash_royale/models/clan_rank'

module ClashRoyale
  class Clan < Model
    attr_property :name, :tag, :description, :type, :score, :required_score, :donations
    attr_accessor :members, :badge, :location, :clan_chest

    def self.find(code)
      response = ClashRoyale.client.get("/clans/#{code}")

      json = JSON.parse(response.body)

      new(json)
    end

    def self.ranking(region: '')
      response = ClashRoyale.client.get("/top/clans/#{region}")

      json = JSON.parse(response.body)

      ranking = []

      json.each { |rank| ranking << ClanRank.new(rank) }

      ranking
    end

    def initialize(json)
      super(json)

      self.members = []

      json_members = json.dig('members') || []

      json_members.each do |member_json|
        members << ClanMember.new(member_json)
      end

      @badge = Badge.new(json.dig('badge'))
      @location = Location.new(json.dig('location'))
      @clan_chest = json.dig('clanChest', 'status')
    end

    def chest_active?
      clan_chest == 'active'
    end
  end
end
