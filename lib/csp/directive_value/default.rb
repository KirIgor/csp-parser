# frozen_string_literal: true

class CSP::DirectiveValue::Default < CSP::DirectiveValue::Base
  private

  def regexp
    /\A#{CSP::Grammar::DIRECTIVE_VALUE}\z/o
  end
end
