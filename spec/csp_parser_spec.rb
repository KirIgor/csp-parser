# frozen_string_literal: true

require_relative "../lib/csp_parser"

describe CSPParser do
  it "returns serialized policy for right grammars" do
    policy = CSPParser.parse(
      "default-src 'self'; "\
                  "img-src *; "\
                  "media-src media1.com media2.com; "\
                  "script-src userscripts.example.com",
    )
    expect(policy.class.name).to eq("SerializedPolicy")
  end

  it "returns true for valid http hosts" do
    expect(CSPParser.valid_http_host_source?("https://*.example.com:*")).to be_truthy
  end

  it "returns false for invalid http hosts" do
    expect(CSPParser.valid_http_host_source?("https://??.example.com:*")).to be_falsey
  end
end
