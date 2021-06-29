# frozen_string_literal: true

describe CSPParser::DirectiveValue::Source::Nonce do
  it "parses right nonce" do
    nonce = CSPParser::DirectiveValue::Source::Nonce.new(
      "'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='",
    )

    expect(nonce.to_s).to eq("'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='")
    expect(nonce.value).to eq("RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=")
  end

  it "raises error if invalid nonce" do
    expect do
      CSPParser::DirectiveValue::Source::Nonce.new("??'")
    end.to raise_error(CSPParser::DirectiveValue::InvalidSource)
  end
end
