# frozen_string_literal: true

require_relative "../lib/directive"

describe Directive do
  it "parses when right type" do
    directive = Directive.new("media-src media1.com media2.com")

    expect(directive.to_s).to eq("media-src media1.com media2.com")
    expect(directive.name).to eq("media-src")
    expect(directive.value.class.name).to eq("DirectiveValue::SerializedSourceList")
  end

  it "raises error when invalid type" do
    expect do
      Directive.new("media-src ??")
    end.to raise_error(DirectiveValue::ParseError)
  end

  it "raises error when invalid directive" do
    expect do
      Directive.new(";??;")
    end.to raise_error(Directive::ParseError)
  end

  it "parses with default value when unknown name" do
    directive = Directive.new("unknown-src ??")

    expect(directive.to_s).to eq("unknown-src ??")
    expect(directive.name).to eq("unknown-src")
    expect(directive.value.class.name).to eq("DirectiveValue::Default")
  end
end
