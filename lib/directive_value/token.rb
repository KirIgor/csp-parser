# frozen_string_literal: true

require_relative './directive_value'
require_relative './base'
require_relative '../grammar'

class DirectiveValue::Token < DirectiveValue::Base
  private

  def regexp
    /\A#{Grammar::TOKEN}\z/
  end
end