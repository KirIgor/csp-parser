# frozen_string_literal: true

require_relative "./csp"
require_relative "./serialized_policy"
require_relative "./directive_value/source/http_host"

class CSP::Parser
  class << self
    def parse(csp_policy_str)
      CSP::SerializedPolicy.new(csp_policy_str)
    end

    def valid_http_host_source?(http_host_str)
      !!CSP::DirectiveValue::Source::HttpHost.new(http_host_str)
    rescue
      false
    end
  end
end
