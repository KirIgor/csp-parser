# frozen_string_literal: true

require_relative "./directive_value"
require_relative "./base"
require_relative "../grammar"
require_relative "../csp"

class CSP::DirectiveValue::Token < CSP::DirectiveValue::Base
  private

  def regexp
    /\A#{CSP::Grammar::TOKEN}\z/o
  end
end
