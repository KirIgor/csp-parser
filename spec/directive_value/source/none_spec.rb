# frozen_string_literal: true

describe CSPParser::DirectiveValue::Source::None do
  it "parses right none" do
    nonce = CSPParser::DirectiveValue::Source::None.new("'none'")

    expect(nonce.to_s).to eq("'none'")
  end

  it "raises error if invalid none" do
    expect do
      CSPParser::DirectiveValue::Source::Nonce.new("??'")
    end.to raise_error(CSPParser::DirectiveValue::InvalidSource)
  end
end
