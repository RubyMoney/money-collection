# frozen_string_literal: true

require "minitest/autorun"
require "money"
require "money/collection"

Money.default_currency = Money::Currency.new("USD")
