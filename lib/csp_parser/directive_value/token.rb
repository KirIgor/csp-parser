# frozen_string_literal: true

class CSPParser::DirectiveValue::Token < CSPParser::DirectiveValue::Base
  private

  def regexp
    /\A#{CSPParser::Grammar::TOKEN}\z/o
  end
end
