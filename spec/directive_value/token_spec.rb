# frozen_string_literal: true

require_relative "../../lib/directive_value/token"

describe DirectiveValue::Token do
  it "parses right token" do
    sandbox = DirectiveValue::Token.new("token")

    expect(sandbox.to_s).to eq("token")
  end

  it "raises error if invalid token" do
    expect do
      DirectiveValue::Token.new("??")
    end.to raise_error(DirectiveValue::ParseError)
  end
end
