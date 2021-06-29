# frozen_string_literal: true

module CSP
  require_relative "csp/directive_value"
  require_relative "csp/directive"
  require_relative "csp/grammar"
  require_relative "csp/serialized_policy"

  class Parser
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
end
