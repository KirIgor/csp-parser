# frozen_string_literal: true

class CSPParser
  require_relative "csp_parser/directive_value"
  require_relative "csp_parser/directive"
  require_relative "csp_parser/grammar"
  require_relative "csp_parser/serialized_policy"

  class << self
    def parse(csp_policy_str)
      CSPParser::SerializedPolicy.new(csp_policy_str)
    end

    def valid_http_host_source?(http_host_str)
      !!CSPParser::DirectiveValue::Source::HttpHost.new(http_host_str)
    rescue
      false
    end
  end
end
