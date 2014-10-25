require_relative 'helper'
require 'benchmark'
require 'money'
require 'money/collection'

Money.add_rate(:usd, :twd, 30.4071518)
Money.add_rate(:twd, :usd, 0.032887)

def generate_samples(size, possible_currencies = [:usd])
  size.times.map do
    Money.new(Random.rand(100000), possible_currencies.sample)
  end
end

benchmarking_sizes = [1,2,5,10,50,100,200,400,600,800,1000]

puts 'Single currency'

samples = generate_samples(benchmarking_sizes.max)
# rehearsal
100.times{ Money::Collection.new(samples).sum }
Benchmark.bm do |x|
  benchmarking_sizes.each do |size|
    x.report "sum #{size} items" do
      sliced_samples = samples.first(size)
      10000.times do
        Money::Collection.new(sliced_samples).sum
      end
    end
  end
end

puts 'Multiple currencies'

samples = generate_samples(benchmarking_sizes.max, [:usd, :twd])
# rehearsal
100.times{ Money::Collection.new(samples).sum }
Benchmark.bm do |x|
  benchmarking_sizes.each do |size|
    x.report "sum #{size} items" do
      sliced_samples = samples.first(size)
      10000.times do
        Money::Collection.new(sliced_samples).sum
      end
    end
  end
end
