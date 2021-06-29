# frozen_string_literal: true

describe CSP::DirectiveValue::Source::Nonce do
  it "parses right nonce" do
    nonce = CSP::DirectiveValue::Source::Nonce.new(
      "'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='",
    )

    expect(nonce.to_s).to eq("'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='")
    expect(nonce.value).to eq("RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=")
  end

  it "raises error if invalid nonce" do
    expect do
      CSP::DirectiveValue::Source::Nonce.new("??'")
    end.to raise_error(CSP::DirectiveValue::InvalidSource)
  end
end
