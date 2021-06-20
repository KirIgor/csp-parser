# frozen_string_literal: true

require_relative "../../../lib/directive_value/source/none"

describe DirectiveValue::Source::None do
  it "parses right none" do
    nonce = DirectiveValue::Source::None.new("'none'")

    expect(nonce.to_s).to eq("'none'")
  end

  it "raises error if invalid none" do
    expect {
      DirectiveValue::Source::Nonce.new("??'")
    }.to raise_error(DirectiveValue::InvalidSource)
  end
end

