# frozen_string_literal: true

# Code from Sinatra::Base
module Mainapp
  module Base
    def set(option, value = (not_set = true))
      if not_set
        raise ArgumentError unless option.respond_to?(:each)
        option.each { |k, v| set(k, v) }
        return self
      end
      getter = proc { value }
      case value
      when Proc
        getter = value
      when Symbol, Integer, FalseClass, TrueClass, NilClass
        getter = value.inspect
      end
      define_singleton(option, getter)
      self
    end

    private

    def define_singleton(name, content = Proc.new)
      singleton_class.class_eval do
        undef_method(name) if method_defined? name
        if String === content
          class_eval("def #{name}() #{content}; end", __FILE__, __LINE__)
        else
          define_method(name, &content)
        end
      end
    end
  end
end
