# frozen_string_literal: true

require_relative "../../../lib/directive_value/source/keyword"

describe DirectiveValue::Source::Keyword do
  it "parses right keyword" do
    keyword = DirectiveValue::Source::Keyword.new("'report-sample'")

    expect(keyword.to_s).to eq("'report-sample'")
  end

  it "raises error if invalid keyword" do
    expect {
      DirectiveValue::Source::Keyword.new("??")
    }.to raise_error(DirectiveValue::InvalidSource)
  end
end

