# frozen_string_literal: true

class CSPParser::DirectiveValue::Source::Keyword < CSPParser::DirectiveValue::Source::Base
  private

  def regexp
    /\A#{CSPParser::Grammar::KEYWORD_SOURCE}\z/o
  end
end
