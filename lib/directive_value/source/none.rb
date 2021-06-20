# frozen_string_literal: true

require_relative '../directive_value'
require_relative './source'
require_relative './base'
require_relative '../../grammar'

class DirectiveValue::Source::None < DirectiveValue::Source::Base
  private

  def regexp
    /\A#{Grammar::NONE_SOURCE}\z/
  end
end