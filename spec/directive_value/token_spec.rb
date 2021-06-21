# frozen_string_literal: true

require_relative "../../lib/directive_value/token"

describe CSP::DirectiveValue::Token do
  it "parses right token" do
    sandbox = CSP::DirectiveValue::Token.new("token")

    expect(sandbox.to_s).to eq("token")
  end

  it "raises error if invalid token" do
    expect do
      CSP::DirectiveValue::Token.new("??")
    end.to raise_error(CSP::DirectiveValue::ParseError)
  end
end
