# frozen_string_literal: true

describe CSP::DirectiveValue::SerializedSourceList do
  it "parses right serialized source list" do
    test_str = "'none' "\
      "'self' "\
      "'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=' "\
      "'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=' "\
      "http: "\
      "*.trusted.com "\
      "ftp://*.example.com:*"

    source_list = CSP::DirectiveValue::SerializedSourceList.new(test_str)

    expect(source_list.to_s).to eq(test_str)
    expect(source_list.sources.map { |s| s.class.name }).to eq(%w[
      CSP::DirectiveValue::Source::None
      CSP::DirectiveValue::Source::Keyword
      CSP::DirectiveValue::Source::Hash
      CSP::DirectiveValue::Source::Nonce
      CSP::DirectiveValue::Source::Scheme
      CSP::DirectiveValue::Source::HttpHost
      CSP::DirectiveValue::Source::Host
    ])
  end

  it "raises error if invalid serialized source list" do
    expect do
      CSP::DirectiveValue::SerializedSourceList.new("??")
    end.to raise_error(CSP::DirectiveValue::ParseError)
  end
end
