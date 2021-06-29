# frozen_string_literal: true

describe CSP::Directive do
  it "parses when right type" do
    directive = CSP::Directive.new("media-src media1.com media2.com")

    expect(directive.to_s).to eq("media-src media1.com media2.com")
    expect(directive.name).to eq("media-src")
    expect(directive.value.class.name).to eq("CSP::DirectiveValue::SerializedSourceList")
  end

  it "raises error when invalid type" do
    expect do
      CSP::Directive.new("media-src ??")
    end.to raise_error(CSP::DirectiveValue::ParseError)
  end

  it "raises error when invalid directive" do
    expect do
      CSP::Directive.new(";??;")
    end.to raise_error(CSP::Directive::ParseError)
  end

  it "parses with default value when unknown name" do
    directive = CSP::Directive.new("unknown-src ??")

    expect(directive.to_s).to eq("unknown-src ??")
    expect(directive.name).to eq("unknown-src")
    expect(directive.value.class.name).to eq("CSP::DirectiveValue::Default")
  end
end
