# frozen_string_literal: true
require_relative './irregular'

class Engine
  CONFIG = {
    billion: 1_000_000_000..(100_000_000_000 - 1),
    million: 1_000_000..(1_000_000_000 - 1),
    thousand: 1_000..(1_000_000 - 1),
    hundred: 100..(1000 - 1)
  }.freeze

  def self.translate(number)
    new(number).translate
  end

  def initialize(number)
    @number = number
  end

  def translate
    return 'Not supporting yet!' if @number >= 100_000_000_000
    convert(@number).join(' ')
  end

  private

  def convert(number)
    irr = Irregular::NUMBERS[number]
    return [irr] if irr
    return under_100(number) if number < 100

    english, range = supported_by_config(number) || []
    above_100(number, range.first, english) if english
  end

  def supported_by_config(number)
    CONFIG.find { |_key, value| value.include?(number) }
  end

  def under_100(number)
    base, mod = number.divmod(10)
    [convert(base * 10), convert(mod)]
  end

  def above_100(number, division, english)
    base, mod = number.divmod(division)
    if mod.positive?
      [convert(base * division), convert(mod)]
    else
      [convert(base), pluralize(english, base)]
    end
  end

  def pluralize(str, number)
    str.to_s + (number > 1 ? 's' : '')
  end
end
