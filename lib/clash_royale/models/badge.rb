# frozen_string_literal: true

require 'clash_royale/model'

module ClashRoyale
  class Badge < Model
    attr_property :name, :category, :id, :image
  end
end
