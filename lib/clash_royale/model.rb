# frozen_string_literal: true

module ClashRoyale
  class Model
    def self.attr_property(*properties)
      @properties ||= []
      @properties += properties

      attr_accessor(*properties)
    end

    def self.properties
      @properties || []
    end

    def initialize(json)
      self.class.properties.each do |prop|
        send("#{prop}=", json[camelize(prop)])
      end
    end

    # Highly inspired in ActiveSupport
    def camelize(string)
      string = string.to_s

      string = string.sub(/^(?:(?=\b|[A-Z_])|\w)/) { $&.downcase }

      string.gsub(%r{(?:_|(/))([a-z\d]*)}) { "#{$1}#{$2.capitalize}" }.gsub('/', '::')
    end
  end
end
