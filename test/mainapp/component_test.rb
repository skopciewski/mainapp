# frozen_string_literal: true

require "test_helper"
require "mainapp/component"

class TestComponent
  include ::Mainapp::Component
  attr_struct :foo, :bar
end

class MainappComponentTest < Minitest::Test
  def setup
    @components = {foo: 1, bar: 2, baz: 3}
    @handler = TestComponent.new @components
  end

  def test_that_handler_has_priv_foo_method
    assert_equal(@handler.respond_to?(:foo), false)
    assert_equal(@handler.respond_to?(:foo, true), true)
  end

  def test_that_handler_priv_foo_method_returns_right_value
    value = @handler.send(:foo)
    assert_equal(value, @components[:foo])
  end

  def test_that_handler_has_priv_bar_method
    assert_equal(@handler.respond_to?(:bar), false)
    assert_equal(@handler.respond_to?(:bar, true), true)
  end

  def test_that_handler_priv_bar_method_returns_right_value
    value = @handler.send(:bar)
    assert_equal(value, @components[:bar])
  end

  def test_that_handler_does_not_have_baz_method
    assert_equal(@handler.respond_to?(:baz, true), false)
  end
end
