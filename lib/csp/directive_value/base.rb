# frozen_string_literal: true

class CSP::DirectiveValue::Base
  def initialize(value_str)
    @value_str = value_str
    @match = @value_str.match(regexp)

    raise CSP::DirectiveValue::ParseError, @value_str if @match.nil?
  end

  def to_s
    @value_str
  end

  # @!method regexp
end
