# frozen_string_literal: true

module Scryfall
  require 'scryfall/base'
  class Sets < Base
    def self.list(**args)
      api.get '/sets', {}, **args
    end

    def self.with_code(code, **args)
      api.get "/sets/#{code}", {}, **args
    end

    def self.with_tcgplayer_id(id, **args)
      api.get "/sets/tcgplayer/#{id}", {}, **args
    end

    def self.with_id(id, **args)
      api.get "/sets/#{id}", {}, **args
    end
  end
end
