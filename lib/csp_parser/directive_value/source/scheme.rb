# frozen_string_literal: true

class CSPParser::DirectiveValue::Source::Scheme < CSPParser::DirectiveValue::Source::Base
  private

  def regexp
    /\A#{CSPParser::Grammar::SCHEME_SOURCE}\z/o
  end
end
