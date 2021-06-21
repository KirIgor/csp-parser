# frozen_string_literal: true

require_relative "./directive_value"
require_relative "./base"
require_relative "../grammar"
require_relative "../csp"

class CSP::DirectiveValue::Sandbox < CSP::DirectiveValue::Base
  private

  def regexp
    /\A#{CSP::Grammar::SANDBOX}\z/o
  end
end
