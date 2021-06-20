# frozen_string_literal: true

require_relative '../directive_value'
require_relative './source'
require_relative './base'
require_relative '../../grammar'

class DirectiveValue::Source::Keyword < DirectiveValue::Source::Base
  private

  def regexp
    /\A#{Grammar::KEYWORD_SOURCE}\z/
  end
end