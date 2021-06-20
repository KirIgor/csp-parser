# frozen_string_literal: true

class DirectiveValue::Base
  def to_s
    @value_str
  end

  def initialize(value_str)
    @value_str = value_str
    @match = @value_str.match(regexp)

    raise DirectiveValue::ParseError, @value_str if @match.nil?
  end

  private

  # @!method regexp
end