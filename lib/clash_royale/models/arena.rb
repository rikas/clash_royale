# frozen_string_literal: true

require 'clash_royale/model'

module ClashRoyale
  class Arena < Model
    attr_property :name, :arena, :arena_i_d, :trophy_limit

    alias arena_id arena_i_d
  end
end
