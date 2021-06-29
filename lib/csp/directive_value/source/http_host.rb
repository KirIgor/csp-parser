# frozen_string_literal: true

class CSP::DirectiveValue::Source::HttpHost < CSP::DirectiveValue::Source::Host
  private

  def regexp
    /\A#{CSP::Grammar::HTTP_HOST_SOURCE}\z/o
  end
end
