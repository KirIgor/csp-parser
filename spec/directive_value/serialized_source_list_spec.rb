# frozen_string_literal: true

describe CSPParser::DirectiveValue::SerializedSourceList do
  it "parses right serialized source list" do
    test_str = "'none' "\
      "'self' "\
      "'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=' "\
      "'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=' "\
      "http: "\
      "*.trusted.com "\
      "ftp://*.example.com:*"

    source_list = CSPParser::DirectiveValue::SerializedSourceList.new(test_str)

    expect(source_list.to_s).to eq(test_str)
    expect(source_list.sources.map { |s| s.class.name }).to eq(%w[
      CSPParser::DirectiveValue::Source::None
      CSPParser::DirectiveValue::Source::Keyword
      CSPParser::DirectiveValue::Source::Hash
      CSPParser::DirectiveValue::Source::Nonce
      CSPParser::DirectiveValue::Source::Scheme
      CSPParser::DirectiveValue::Source::HttpHost
      CSPParser::DirectiveValue::Source::Host
    ])
  end

  it "raises error if invalid serialized source list" do
    expect do
      CSPParser::DirectiveValue::SerializedSourceList.new("??")
    end.to raise_error(CSPParser::DirectiveValue::ParseError)
  end
end
