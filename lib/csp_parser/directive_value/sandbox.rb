# frozen_string_literal: true

class CSPParser::DirectiveValue::Sandbox < CSPParser::DirectiveValue::Base
  private

  def regexp
    /\A#{CSPParser::Grammar::SANDBOX}\z/o
  end
end
