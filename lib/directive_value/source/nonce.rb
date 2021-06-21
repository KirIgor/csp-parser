# frozen_string_literal: true

require_relative "./source"
require_relative "./base"
require_relative "../../grammar"

class CSP::DirectiveValue::Source::Nonce < CSP::DirectiveValue::Source::Base
  def value
    @match[:value]
  end

  private

  def regexp
    /\A#{CSP::Grammar::NONCE_SOURCE}\z/o
  end
end
