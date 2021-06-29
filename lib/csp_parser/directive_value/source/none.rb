# frozen_string_literal: true

class CSPParser::DirectiveValue::Source::None < CSPParser::DirectiveValue::Source::Base
  private

  def regexp
    /\A#{CSPParser::Grammar::NONE_SOURCE}\z/o
  end
end
