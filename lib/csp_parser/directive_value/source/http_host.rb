# frozen_string_literal: true

class CSPParser::DirectiveValue::Source::HttpHost < CSPParser::DirectiveValue::Source::Host
  private

  def regexp
    /\A#{CSPParser::Grammar::HTTP_HOST_SOURCE}\z/o
  end
end
