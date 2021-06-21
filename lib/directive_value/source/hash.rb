# frozen_string_literal: true

require_relative "../directive_value"
require_relative "./source"
require_relative "./base"
require_relative "../../grammar"
require_relative "../../csp"

class CSP::DirectiveValue::Source::Hash < CSP::DirectiveValue::Source::Base
  def algorithm
    @match[:algorithm]
  end

  def value
    @match[:value]
  end

  private

  def regexp
    /\A#{CSP::Grammar::HASH_SOURCE}\z/o
  end
end
