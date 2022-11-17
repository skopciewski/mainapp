# Mainapp

[![Gem Version](https://badge.fury.io/rb/mainapp.svg)](http://badge.fury.io/rb/mainapp)

`.set` method extracted from the Sinatra::Base, and helper for the components
convention

## Installation

Add this line to your application's Gemfile:

    gem 'mainapp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mainapp

## Usage

### Creating structure with components

```ruby
class My
  extend ::Mainapp::Base
end

My.set foo: 1

My.foo #=> 1
```

### Working with components

```ruby
class TestComponent
  include ::Mainapp::Component
  attr_struct :foo, :bar

  def some_method
    pp foo
  end
end

components = {foo: 1, bar: 2, baz: 3}
handler = TestComponent.new components
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
