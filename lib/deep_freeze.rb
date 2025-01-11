# frozen_string_literal: true

require_relative "deep_freeze/version"

module DeepFreeze
  def deep_freeze(obj)
    case obj
    when String , Symbol, Numeric, TrueClass, FalseClass
      obj.freeze
    when Hash
      obj.each do |key, value|
        deep_freeze(key)
        deep_freeze(value)
      end
      obj.freeze
    when Array
      obj.each do |element|
        deep_freeze(element)
      end
    else
      raise 'Invalid object'
    end
  end
end
