# frozen_string_literal: true

require_relative "../directive_value"
require_relative "./source"
require_relative "../../grammar"
require_relative "./host"

class DirectiveValue::Source::HttpHost < DirectiveValue::Source::Host
  private

  def regexp
    /\A#{Grammar::HTTP_HOST_SOURCE}\z/o
  end
end
