# frozen_string_literal: true

require_relative "../../../lib/directive_value/source/scheme"

describe CSP::DirectiveValue::Source::Scheme do
  it "parses right scheme" do
    nonce = CSP::DirectiveValue::Source::Scheme.new("example:")

    expect(nonce.to_s).to eq("example:")
  end

  it "raises error if invalid scheme" do
    expect do
      CSP::DirectiveValue::Source::Scheme.new("??'")
    end.to raise_error(CSP::DirectiveValue::InvalidSource)
  end
end
