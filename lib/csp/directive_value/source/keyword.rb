# frozen_string_literal: true

class CSP::DirectiveValue::Source::Keyword < CSP::DirectiveValue::Source::Base
  private

  def regexp
    /\A#{CSP::Grammar::KEYWORD_SOURCE}\z/o
  end
end
