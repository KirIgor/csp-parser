# frozen_string_literal: true

require_relative "../directive_value"
require_relative "./source"
require_relative "./base"
require_relative "../../grammar"
require_relative "../../csp"

class CSP::DirectiveValue::Source::Nonce < CSP::DirectiveValue::Source::Base
  def value
    @match[:value]
  end

  private

  def regexp
    /\A#{CSP::Grammar::NONCE_SOURCE}\z/o
  end
end
