# frozen_string_literal: true

describe CSPParser::DirectiveValue::Default do
  it "parses right directive value" do
    sandbox = CSPParser::DirectiveValue::Default.new("token")

    expect(sandbox.to_s).to eq("token")
  end

  it "raises error if invalid directive value" do
    expect do
      CSPParser::DirectiveValue::Default.new(",")
    end.to raise_error(CSPParser::DirectiveValue::ParseError)
  end
end
