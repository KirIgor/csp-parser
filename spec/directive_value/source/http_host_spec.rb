# frozen_string_literal: true

describe CSP::DirectiveValue::Source::HttpHost do
  it "parses right hosts" do
    host = CSP::DirectiveValue::Source::HttpHost.new("https://*.example.com:*/path")

    expect(host.to_s).to eq("https://*.example.com:*/path")
    expect(host.scheme_part).to eq("https")
    expect(host.host_part).to eq("*.example.com")
    expect(host.port_part).to eq("*")
    expect(host.path_part).to eq("/path")
  end

  it "raises error if invalid host" do
    expect do
      CSP::DirectiveValue::Source::HttpHost.new("ftp://*.example.com:*/path")
    end.to raise_error(CSP::DirectiveValue::InvalidSource)
  end
end
