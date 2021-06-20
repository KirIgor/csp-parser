# frozen_string_literal: true

require_relative './grammar'
require_relative './directive'

class SerializedPolicy
  ParseError = Class.new(StandardError)

  def to_s
    @value_str
  end

  attr_reader :directives

  def initialize(value_str)
    @value_str = value_str
    @match = @value_str.match(regexp)

    raise ParseError, @value_str if @match.nil?

    @directives = @value_str.split(";").map { |directive_str| Directive.new(directive_str.strip) }
  end

  private

  def regexp
    /\A#{Grammar::SERIALIZED_POLICY}\z/
  end
end