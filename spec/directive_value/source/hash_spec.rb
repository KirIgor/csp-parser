# frozen_string_literal: true

describe CSPParser::DirectiveValue::Source::Hash do
  it "parses right hashes" do
    hash = CSPParser::DirectiveValue::Source::Hash.new(
      "'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='",
    )

    expect(hash.to_s).to eq("'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='")
    expect(hash.algorithm).to eq("sha256")
    expect(hash.value).to eq("RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=")
  end

  it "raises error if invalid hash" do
    expect do
      CSPParser::DirectiveValue::Source::Hash.new("??'")
    end.to raise_error(CSPParser::DirectiveValue::InvalidSource)
  end
end
