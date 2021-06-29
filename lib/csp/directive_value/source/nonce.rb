# frozen_string_literal: true

class CSP::DirectiveValue::Source::Nonce < CSP::DirectiveValue::Source::Base
  def value
    @match[:value]
  end

  private

  def regexp
    /\A#{CSP::Grammar::NONCE_SOURCE}\z/o
  end
end
