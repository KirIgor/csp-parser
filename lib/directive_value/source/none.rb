# frozen_string_literal: true

require_relative "../directive_value"
require_relative "./source"
require_relative "./base"
require_relative "../../grammar"
require_relative "../../csp"

class CSP::DirectiveValue::Source::None < CSP::DirectiveValue::Source::Base
  private

  def regexp
    /\A#{CSP::Grammar::NONE_SOURCE}\z/o
  end
end
