# frozen_string_literal: true

require_relative "./source"
require_relative "./base"
require_relative "../../grammar"

class CSP::DirectiveValue::Source::None < CSP::DirectiveValue::Source::Base
  private

  def regexp
    /\A#{CSP::Grammar::NONE_SOURCE}\z/o
  end
end
