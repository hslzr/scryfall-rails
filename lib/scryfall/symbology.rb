# frozen_string_literal: true

module Scryfall
  require 'scryfall/base'
  class Symbology < Base
    def self.list(**args)
      api.get '/symbology', {}, **args
    end
  end
end
