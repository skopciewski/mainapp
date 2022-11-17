# frozen_string_literal: true

require "ostruct"

module Mainapp
  module Component
    def self.included(base)
      base.extend ClassMethods
      base.prepend PrepMethods
    end

    module PrepMethods
      def initialize(config = {})
        @config = OpenStruct.new(config.to_h).to_h
        super if initialize_in_ancestor?
      end

      protected

      def initialize_in_ancestor?
        self.class.ancestors[1].private_instance_methods(false).include?(:initialize)
      end
    end

    module ClassMethods
      def attr_struct(*components)
        components.each do |name|
          next if method_defined?(name)
          define_method name do
            @config[name.to_sym]
          end
          private name
        end
      end
    end
  end
end
