# frozen_string_literal: true

require_relative "../../../lib/directive_value/source/nonce"

describe DirectiveValue::Source::Nonce do
  it "parses right nonce" do
    nonce = DirectiveValue::Source::Nonce.new(
      "'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='",
    )

    expect(nonce.to_s).to eq("'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='")
    expect(nonce.value).to eq("RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=")
  end

  it "raises error if invalid nonce" do
    expect do
      DirectiveValue::Source::Nonce.new("??'")
    end.to raise_error(DirectiveValue::InvalidSource)
  end
end
