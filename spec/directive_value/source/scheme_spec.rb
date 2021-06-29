# frozen_string_literal: true

describe CSPParser::DirectiveValue::Source::Scheme do
  it "parses right scheme" do
    nonce = CSPParser::DirectiveValue::Source::Scheme.new("example:")

    expect(nonce.to_s).to eq("example:")
  end

  it "raises error if invalid scheme" do
    expect do
      CSPParser::DirectiveValue::Source::Scheme.new("??'")
    end.to raise_error(CSPParser::DirectiveValue::InvalidSource)
  end
end
