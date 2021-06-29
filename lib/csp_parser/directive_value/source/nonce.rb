# frozen_string_literal: true

class CSPParser::DirectiveValue::Source::Nonce < CSPParser::DirectiveValue::Source::Base
  def value
    @match[:value]
  end

  private

  def regexp
    /\A#{CSPParser::Grammar::NONCE_SOURCE}\z/o
  end
end
