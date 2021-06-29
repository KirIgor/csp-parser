# frozen_string_literal: true

describe CSPParser::DirectiveValue::Source::Keyword do
  it "parses right keyword" do
    keyword = CSPParser::DirectiveValue::Source::Keyword.new("'report-sample'")

    expect(keyword.to_s).to eq("'report-sample'")
  end

  it "raises error if invalid keyword" do
    expect do
      CSPParser::DirectiveValue::Source::Keyword.new("??")
    end.to raise_error(CSPParser::DirectiveValue::InvalidSource)
  end
end
