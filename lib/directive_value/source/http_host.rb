# frozen_string_literal: true

require_relative "../directive_value"
require_relative "./source"
require_relative "../../grammar"
require_relative "./host"
require_relative "../../csp"

class CSP::DirectiveValue::Source::HttpHost < CSP::DirectiveValue::Source::Host
  private

  def regexp
    /\A#{CSP::Grammar::HTTP_HOST_SOURCE}\z/o
  end
end
