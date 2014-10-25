require 'helper'
require 'money'
require 'money/collection'

describe Money::Collection do
  before do
    foo = {
      :iso_code        => "FOO",
      :subunit_to_unit => 100,
    }
    Money::Currency.register(foo)

    Money.add_rate("FOO", "USD", 0.5)
    Money.add_rate("USD", "FOO", 2)
  end

  it 'has version' do
    Money::Collection.const_get('VERSION').wont_be_empty
  end

  describe '#sum' do

    it 'sums with no element' do
      c = Money::Collection.new
      c.sum.must_equal Money.new(0)
    end

    it 'sums with single element' do
      c = Money::Collection.new
      c << Money.new(10,:usd)
      c.sum.must_equal Money.new(10,:usd)
    end

    it 'sums same currency' do
      ary = [
        Money.new(10,:usd),
        Money.new(20,:usd),
        Money.new(30,:usd),
      ]

      c = Money::Collection.new(ary)

      c.sum.must_equal Money.new(60,:usd)
    end

    it 'sums different currencies' do
      ary = [
        Money.new(100,:usd),
        Money.new(10,:foo),
      ]

      c = Money::Collection.new(ary)

      c.sum.must_equal normal_sum(ary)
    end

    it 'sums correctly, avoiding rounding down error' do
      ary = [
        Money.new(10,:usd),
        Money.new(1,:foo),
        Money.new(1,:foo),
      ]

      c = Money::Collection.new(ary)

      c.sum.must_equal Money.new(11,:usd)
    end

    it 'returns sum in the specified currency' do
      ary = [
        Money.new(10,:usd),
        Money.new(2,:foo),
      ]

      c = Money::Collection.new(ary)

      c.sum('foo').must_equal Money.new(22,:foo)
      c.sum('usd').must_equal Money.new(11,:usd)
    end
  end

  describe '#concat' do
    it 'concats Money objects to collection' do
      ary = [
        Money.new(10,:usd),
        Money.new(2,:foo),
      ]

      c = Money::Collection.new
      c.concat ary

      c.sum('foo').must_equal Money.new(22,:foo)
    end
    it 'concats Money objects to collection multiple times' do
      ary = [
        Money.new(10,:usd),
        Money.new(2,:foo),
      ]

      c = Money::Collection.new
      c.concat ary
      c.concat ary

      c.sum('foo').must_equal Money.new(44,:foo)
    end
  end

  describe '#<<' do
    it 'concats Money object to collection multiple times' do
      c = Money::Collection.new
      c << Money.new(10,:usd)
      c << Money.new(10,:foo)
      c << Money.new(10,:usd)

      c.sum.must_equal Money.new(25,:usd)
    end
  end

  describe 'no side effect' do
    it 'does not change original array that is passed in the initialize method' do
      m1 = Money.new(10,:usd)
      ary = [m1]

      c = Money::Collection.new(ary)
      c << Money.new(1,:usd)

      ary.size.must_equal 1
      ary[0].must_equal m1
    end
  end
end

# Adds up array of Money one by one and returns the sum.
def normal_sum(array)
  array.reduce{|total, money| total + money }
end
