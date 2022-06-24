# frozen_string_literal: true

require "test_helper"
require "mainapp/base"

class MainappBaseTest < Minitest::Test
  extend ::Mainapp::Base

  def setup
    @struct = {foo: "bar", bar: proc { foo.upcase }, int: 1, bool: true, hash: {a: 1, b: 2}}
    @app = self.class
    @app.set @struct
  end

  def test_that_class_has_foo
    assert_equal(@app.foo, @struct[:foo])
  end

  def test_that_reference_is_possible
    assert_equal(@app.bar, @struct[:foo].upcase)
  end

  def test_override
    @app.set foo: "baz"
    assert_equal(@app.foo, "baz")
  end

  def test_int
    assert_equal(@app.int, @struct[:int])
  end

  def test_bool
    assert_equal(@app.bool, @struct[:bool])
  end

  def test_hash
    assert_equal(@app.hash, @struct[:hash])
  end
end
