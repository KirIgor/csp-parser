# frozen_string_literal: true

require_relative "../../../lib/directive_value/source/none"

describe CSP::DirectiveValue::Source::None do
  it "parses right none" do
    nonce = CSP::DirectiveValue::Source::None.new("'none'")

    expect(nonce.to_s).to eq("'none'")
  end

  it "raises error if invalid none" do
    expect do
      CSP::DirectiveValue::Source::Nonce.new("??'")
    end.to raise_error(CSP::DirectiveValue::InvalidSource)
  end
end
