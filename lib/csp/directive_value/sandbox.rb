# frozen_string_literal: true

class CSP::DirectiveValue::Sandbox < CSP::DirectiveValue::Base
  private

  def regexp
    /\A#{CSP::Grammar::SANDBOX}\z/o
  end
end
