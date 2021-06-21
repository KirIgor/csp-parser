# frozen_string_literal: true

require_relative "./source"
require_relative "./base"
require_relative "../../grammar"

class CSP::DirectiveValue::Source::Keyword < CSP::DirectiveValue::Source::Base
  private

  def regexp
    /\A#{CSP::Grammar::KEYWORD_SOURCE}\z/o
  end
end
