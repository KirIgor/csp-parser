# frozen_string_literal: true

require_relative "../csp"

module CSP::DirectiveValue
  ParseError = Class.new(StandardError)
  InvalidSource = Class.new(StandardError)
end
