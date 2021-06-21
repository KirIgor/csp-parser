# frozen_string_literal: true

require_relative "../../lib/directive_value/default"

describe CSP::DirectiveValue::Default do
  it "parses right directive value" do
    sandbox = CSP::DirectiveValue::Default.new("token")

    expect(sandbox.to_s).to eq("token")
  end

  it "raises error if invalid directive value" do
    expect do
      CSP::DirectiveValue::Default.new(",")
    end.to raise_error(CSP::DirectiveValue::ParseError)
  end
end
