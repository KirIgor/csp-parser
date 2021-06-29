# frozen_string_literal: true

describe CSPParser::DirectiveValue::Token do
  it "parses right token" do
    sandbox = CSPParser::DirectiveValue::Token.new("token")

    expect(sandbox.to_s).to eq("token")
  end

  it "raises error if invalid token" do
    expect do
      CSPParser::DirectiveValue::Token.new("??")
    end.to raise_error(CSPParser::DirectiveValue::ParseError)
  end
end
