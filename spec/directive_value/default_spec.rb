# frozen_string_literal: true

require_relative "../../lib/directive_value/default"

describe DirectiveValue::Default do
  it "parses right directive value" do
    sandbox = DirectiveValue::Default.new("token")

    expect(sandbox.to_s).to eq("token")
  end

  it "raises error if invalid directive value" do
    expect {
      DirectiveValue::Default.new(",")
    }.to raise_error(DirectiveValue::ParseError)
  end
end

