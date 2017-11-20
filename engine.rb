# frozen_string_literal: true
require_relative './irregular'

class Engine
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

    if number < 100_000_000_000 && number >= 1_000_000_000
      above_100(number, 1_000_000_000, 'billion')
    elsif number < 1_000_000_000 && number >= 1_000_000
      above_100(number, 1_000_000, 'million')
    elsif number < 1_000_000 && number >= 1000
      above_100(number, 1000, 'thousand')
    elsif number < 1000 && number >= 100
      above_100(number, 100, 'hundred')
    else
      under_100(number)
    end
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
    str + (number > 1 ? 's' : '')
  end
end
