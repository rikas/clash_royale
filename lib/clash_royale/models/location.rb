# frozen_string_literal: true

require 'clash_royale/model'

module ClashRoyale
  class Location < Model
    attr_property :name, :is_country, :code
  end
end
