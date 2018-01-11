# frozen_string_literal: true

require 'clash_royale/model'
require 'clash_royale/models/arena'

module ClashRoyale
  class ClanMember < Model
    attr_property :name, :tag, :rank, :previous_rank, :role, :exp_level, :donations_percent
    attr_property :clan_chest_crowns, :donations, :donations_received, :donations_delta, :trophies

    attr_accessor :arena

    def initialize(json)
      super(json)

      @arena = Arena.new(json.dig('arena'))
    end
  end
end
