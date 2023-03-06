# frozen_string_literal: true

require_relative "mazer_rails/version"

module MazerRails
  class << self
    def load!
      require 'mazer_rails/engine'
    end
  end
end

MazerRails.load!