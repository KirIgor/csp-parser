# frozen_string_literal: true

class CSP::DirectiveValue::Token < CSP::DirectiveValue::Base
  private

  def regexp
    /\A#{CSP::Grammar::TOKEN}\z/o
  end
end
