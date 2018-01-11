# frozen_string_literal: true

module ClashRoyale
  module Configuration
    attr_accessor :token

    def configure
      yield self
    end
  end
end
