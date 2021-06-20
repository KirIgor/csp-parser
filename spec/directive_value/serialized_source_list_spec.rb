# frozen_string_literal: true

require_relative "../../lib/directive_value/serialized_source_list"

describe DirectiveValue::SerializedSourceList do
  it "parses right serialized source list" do
    test_str = "'none' "\
      "'self' "\
      "'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=' "\
      "'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=' "\
      "http: "\
      "*.trusted.com "\
      "ftp://*.example.com:*"

    source_list = DirectiveValue::SerializedSourceList.new(test_str)

    expect(source_list.to_s).to eq(test_str)
    expect(source_list.sources.map { |s| s.class.name }).to eq(%w[
      DirectiveValue::Source::None
      DirectiveValue::Source::Keyword
      DirectiveValue::Source::Hash
      DirectiveValue::Source::Nonce
      DirectiveValue::Source::Scheme
      DirectiveValue::Source::HttpHost
      DirectiveValue::Source::Host
    ])
  end

  it "raises error if invalid serialized source list" do
    expect do
      DirectiveValue::SerializedSourceList.new("??")
    end.to raise_error(DirectiveValue::ParseError)
  end
end
