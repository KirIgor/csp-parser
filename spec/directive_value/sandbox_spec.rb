# frozen_string_literal: true

require_relative "../../lib/directive_value/sandbox"

describe DirectiveValue::Sandbox do
  it "parses right sandbox" do
    sandbox = DirectiveValue::Sandbox.new("allow-scripts")

    expect(sandbox.to_s).to eq("allow-scripts")
  end

  it "parses empty sandbox" do
    sandbox = DirectiveValue::Sandbox.new("")

    expect(sandbox.to_s).to eq("")
  end

  it "raises error if invalid sandbox" do
    expect do
      DirectiveValue::Sandbox.new("??")
    end.to raise_error(DirectiveValue::ParseError)
  end
end
