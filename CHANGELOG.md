# Changelog

## Unreleased

## 1.0.0

- **Breaking change**: Update Money gem dependency to ~> 7.0. See the [Money 7.0 upgrading guide](https://github.com/RubyMoney/money/blob/main/UPGRADING-7.0.md)
- **Breaking change**: Drop support for Ruby < 3.1

## 0.1.0

- Initial release
- Add `Money::Collection` class for optimized sum/min/max operations on Money objects
- Minimize currency conversions for accuracy and efficiency
- Support enumerable operations with `#concat` and `#<<` methods
