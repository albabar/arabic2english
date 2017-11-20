# frozen_string_literal: true

require_relative './engine'

class Arabic2English
  def initialize
    puts Engine.translate(ARGV[0].to_i.abs)
  end
end
