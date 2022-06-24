# Mainapp

[![Gem Version](https://badge.fury.io/rb/mainapp.svg)](http://badge.fury.io/rb/mainapp)

`.set` method extracted from the Sinatra::Base

## Installation

Add this line to your application's Gemfile:

    gem 'mainapp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mainapp

## Usage

```ruby
class My
  extend ::Mainapp::Base
end

My.set foo: 1

My.foo => 1
```

## Versioning

See [semver.org][semver]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[semver]: http://semver.org/
