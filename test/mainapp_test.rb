# frozen_string_literal: true

require "test_helper"
require "mainapp/base"

class MainappTest < Minitest::Test
  def setup
  end

  def test_that_it_has_a_version_number
    refute_nil ::Mainapp::VERSION
  end
end
