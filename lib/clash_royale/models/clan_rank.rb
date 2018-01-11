# frozen_string_literal: true

require 'clash_royale/model'
require 'clash_royale/models/badge'
require 'clash_royale/models/location'

module ClashRoyale
  class ClanRank < Model
    attr_property :tag, :name, :score, :member_count, :rank, :previous_rank
    attr_accessor :badge, :location

    def initialize(json)
      super(json)

      @badge = Badge.new(json.dig('badge'))
      @location = Location.new(json.dig('location'))
    end
  end
end
