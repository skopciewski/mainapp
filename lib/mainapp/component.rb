# frozen_string_literal: true

require "ostruct"

module Mainapp
  module Component
    def self.extended(mod)
      mod.class_eval(
        "def initialize(config = {}) @config = OpenStruct.new(config).to_h end",
        __FILE__, __LINE__ - 1
      )
    end

    def attr_app(*components)
      components.each do |name|
        define_method name do
          @config[name.to_sym]
        end
        private name
      end
    end
  end
end
