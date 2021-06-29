# frozen_string_literal: true

describe CSP::DirectiveValue::Source::Hash do
  it "parses right hashes" do
    hash = CSP::DirectiveValue::Source::Hash.new(
      "'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='",
    )

    expect(hash.to_s).to eq("'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='")
    expect(hash.algorithm).to eq("sha256")
    expect(hash.value).to eq("RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=")
  end

  it "raises error if invalid hash" do
    expect do
      CSP::DirectiveValue::Source::Hash.new("??'")
    end.to raise_error(CSP::DirectiveValue::InvalidSource)
  end
end
