# frozen_string_literal: true

describe CSP::SerializedPolicy do
  it "parses right policy" do
    policy_str = "default-src 'self'; "\
                 "img-src *; media-src media1.com media2.com; "\
                 "script-src userscripts.example.com"
    policy = CSP::SerializedPolicy.new(policy_str)

    expect(policy.to_s).to eq(policy_str)
    expect(policy.directives.map(&:name)).to eq(%w[default-src img-src media-src script-src])
    expect(policy.directives.map { |d| d.value.class.name }).to eq(
      Array.new(4) { "CSP::DirectiveValue::SerializedSourceList" },
    )
  end

  it "raises error if invalid policy" do
    expect do
      CSP::SerializedPolicy.new(";??;")
    end.to raise_error(CSP::SerializedPolicy::ParseError)
  end
end
