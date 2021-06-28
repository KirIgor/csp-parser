# frozen_string_literal: true

class CSP::DirectiveValue::Source::None < CSP::DirectiveValue::Source::Base
  private

  def regexp
    /\A#{CSP::Grammar::NONE_SOURCE}\z/o
  end
end
