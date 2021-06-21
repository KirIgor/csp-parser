# frozen_string_literal: true

require_relative "../../../lib/directive_value/source/keyword"

describe CSP::DirectiveValue::Source::Keyword do
  it "parses right keyword" do
    keyword = CSP::DirectiveValue::Source::Keyword.new("'report-sample'")

    expect(keyword.to_s).to eq("'report-sample'")
  end

  it "raises error if invalid keyword" do
    expect do
      CSP::DirectiveValue::Source::Keyword.new("??")
    end.to raise_error(CSP::DirectiveValue::InvalidSource)
  end
end
