# frozen_string_literal: true

describe CSPParser::DirectiveValue::Source::Host do
  it "parses right hosts" do
    host = CSPParser::DirectiveValue::Source::Host.new("ftp://*.example.com:*/path")

    expect(host.to_s).to eq("ftp://*.example.com:*/path")
    expect(host.scheme_part).to eq("ftp")
    expect(host.host_part).to eq("*.example.com")
    expect(host.port_part).to eq("*")
    expect(host.path_part).to eq("/path")
  end

  it "raises error if invalid host" do
    expect do
      CSPParser::DirectiveValue::Source::Host.new("??'")
    end.to raise_error(CSPParser::DirectiveValue::InvalidSource)
  end
end
