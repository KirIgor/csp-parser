# frozen_string_literal: true

class CSPParser::DirectiveValue::Source::Hash < CSPParser::DirectiveValue::Source::Base
  def algorithm
    @match[:algorithm]
  end

  def value
    @match[:value]
  end

  private

  def regexp
    /\A#{CSPParser::Grammar::HASH_SOURCE}\z/o
  end
end
