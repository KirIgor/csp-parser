# frozen_string_literal: true

require "simplecov"
require "csp_parser"

SimpleCov.start do
  enable_coverage :branch

  add_filter "/spec/"

  add_group "DirectiveValue", "lib/directive_value"
  add_group "Source", "lib/directive_value/source"

  minimum_coverage 90
  maximum_coverage_drop 2
end
