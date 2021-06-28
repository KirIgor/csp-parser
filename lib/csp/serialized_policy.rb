# frozen_string_literal: true

class CSP::SerializedPolicy
  ParseError = Class.new(StandardError)

  def initialize(value_str)
    @value_str = value_str
    @match = @value_str.match(regexp)

    raise ParseError, @value_str if @match.nil?

    @directives = @value_str.split(";").map do |directive_str|
      CSP::Directive.new(directive_str.strip)
    end
  end

  def to_s
    @value_str
  end

  attr_reader :directives

  private

  def regexp
    /\A#{CSP::Grammar::SERIALIZED_POLICY}\z/o
  end
end
