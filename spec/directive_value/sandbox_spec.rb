# frozen_string_literal: true

require_relative "../../lib/directive_value/sandbox"

describe CSP::DirectiveValue::Sandbox do
  it "parses right sandbox" do
    sandbox = CSP::DirectiveValue::Sandbox.new("allow-scripts")

    expect(sandbox.to_s).to eq("allow-scripts")
  end

  it "parses empty sandbox" do
    sandbox = CSP::DirectiveValue::Sandbox.new("")

    expect(sandbox.to_s).to eq("")
  end

  it "raises error if invalid sandbox" do
    expect do
      CSP::DirectiveValue::Sandbox.new("??")
    end.to raise_error(CSP::DirectiveValue::ParseError)
  end
end
