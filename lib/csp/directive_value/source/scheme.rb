# frozen_string_literal: true

class CSP::DirectiveValue::Source::Scheme < CSP::DirectiveValue::Source::Base
  private

  def regexp
    /\A#{CSP::Grammar::SCHEME_SOURCE}\z/o
  end
end
