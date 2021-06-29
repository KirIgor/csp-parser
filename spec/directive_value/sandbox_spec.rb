# frozen_string_literal: true

describe CSPParser::DirectiveValue::Sandbox do
  it "parses right sandbox" do
    sandbox = CSPParser::DirectiveValue::Sandbox.new("allow-scripts")

    expect(sandbox.to_s).to eq("allow-scripts")
  end

  it "parses empty sandbox" do
    sandbox = CSPParser::DirectiveValue::Sandbox.new("")

    expect(sandbox.to_s).to eq("")
  end

  it "raises error if invalid sandbox" do
    expect do
      CSPParser::DirectiveValue::Sandbox.new("??")
    end.to raise_error(CSPParser::DirectiveValue::ParseError)
  end
end
