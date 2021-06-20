# frozen_string_literal: true

require_relative '../directive_value'
require_relative './source'
require_relative './base'
require_relative '../../grammar'

class DirectiveValue::Source::Hash < DirectiveValue::Source::Base
  def algorithm
    @match[:algorithm]
  end

  def value
    @match[:value]
  end

  private

  def regexp
    /\A#{Grammar::HASH_SOURCE}\z/
  end
end