# frozen_string_literal: true

class CSPParser::DirectiveValue::Default < CSPParser::DirectiveValue::Base
  private

  def regexp
    /\A#{CSPParser::Grammar::DIRECTIVE_VALUE}\z/o
  end
end
