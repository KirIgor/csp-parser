# frozen_string_literal: true

require_relative "../directive_value"
require_relative "./source"
require_relative "./base"
require_relative "../../grammar"

class DirectiveValue::Source::Nonce < DirectiveValue::Source::Base
  def value
    @match[:value]
  end

  private

  def regexp
    /\A#{Grammar::NONCE_SOURCE}\z/o
  end
end
