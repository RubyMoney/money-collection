# Money::Collection

Calculating sum/min/max on a bunch of Money objects, with __accuracy__ and __efficiency__.

This is achieved by minimizing number of currency conversions and object creations.

For large collections, sum/min/max can perform up to 4 times as fast. For small collections (n<10), it can perform at least 2 times as fast.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'money-collection'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install money-collection

## Usage

Here is the demo of the Money::Collection library:

```ruby
require 'money'
require 'money/collection'

c = Money::Collection.new( [money1, money2] )
c << money3
c.concat [money4, money5]

c.sum
c.sum('TWD') # returns sum in TWD currency.
c.max
c.min
```

For more, please check the API documentation.

## Contributing

The followings areas can use some of your expertise:

* Benchmarking, including comparison between commits.
* Accuracy improvement
* Optimization

## License

MIT License (See LICENSE)

