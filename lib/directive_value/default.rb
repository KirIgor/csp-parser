# frozen_string_literal: true

require_relative "./directive_value"
require_relative "./base"
require_relative "../grammar"

class CSP::DirectiveValue::Default < CSP::DirectiveValue::Base
  private

  def regexp
    /\A#{CSP::Grammar::DIRECTIVE_VALUE}\z/o
  end
end
