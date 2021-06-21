# frozen_string_literal: true

require_relative "./source"
require_relative "./base"
require_relative "../../grammar"

class CSP::DirectiveValue::Source::Scheme < CSP::DirectiveValue::Source::Base
  private

  def regexp
    /\A#{CSP::Grammar::SCHEME_SOURCE}\z/o
  end
end
