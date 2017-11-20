require 'minitest/autorun'
require 'minitest/spec'
require_relative '../engine'

describe Engine do
  describe '.translate' do
    it 'translate 0 to zero' do
      assert Engine.translate(0) == 'zero'
    end

    it 'translate 1 to one' do
      assert Engine.translate(1) == 'one'
    end

    it 'translate 55 to Fifty five' do
      assert Engine.translate(55) == 'fifty five'
    end

    it 'translate 100' do
      assert Engine.translate(100) == 'one hundred'
    end

    it 'translate 500' do
      assert Engine.translate(500) == 'five hundreds'
    end

    it 'translate 1000' do
      assert Engine.translate(1000) == 'one thousand'
    end

    it 'translate 654758' do
      assert Engine.translate(654_758) == 'six hundreds fifty four thousands seven hundreds fifty eight'
    end

    it 'translate 9677647' do
      assert Engine.translate(9_677_647) == 'nine millions six hundreds seventy seven thousands six hundreds forty seven'
    end

    it 'translate irregular numbers correctly' do
      assert Engine.translate(2) == 'two'
      assert Engine.translate(3) == 'three'
      assert Engine.translate(4) == 'four'
      assert Engine.translate(5) == 'five'
      assert Engine.translate(6) == 'six'
      assert Engine.translate(7) == 'seven'
      assert Engine.translate(8) == 'eight'
      assert Engine.translate(9) == 'nine'
      assert Engine.translate(11) == 'eleven'
      assert Engine.translate(12) == 'twelve'
      assert Engine.translate(13) == 'thirteen'
      assert Engine.translate(14) == 'fourteen'
      assert Engine.translate(15) == 'fifteen'
      assert Engine.translate(16) == 'sixteen'
      assert Engine.translate(17) == 'seventeen'
      assert Engine.translate(18) == 'eighteen'
      assert Engine.translate(19) == 'nineteen'
    end

    it 'translates decimals correctly' do
      assert Engine.translate(10) == 'ten'
      assert Engine.translate(20) == 'twenty'
      assert Engine.translate(30) == 'thirty'
      assert Engine.translate(40) == 'forty'
      assert Engine.translate(50) == 'fifty'
      assert Engine.translate(60) == 'sixty'
      assert Engine.translate(70) == 'seventy'
      assert Engine.translate(80) == 'eighty'
      assert Engine.translate(90) == 'ninety'
    end
  end
end
