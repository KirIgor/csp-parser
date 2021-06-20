# frozen_string_literal: true

require_relative "../directive_value"
require_relative "./source"
require_relative "./base"
require_relative "../../grammar"

class DirectiveValue::Source::Scheme < DirectiveValue::Source::Base
  private

  def regexp
    /\A#{Grammar::SCHEME_SOURCE}\z/o
  end
end
