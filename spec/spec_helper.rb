# frozen_string_literal: true

require "simplecov"

SimpleCov.start do
  enable_coverage :branch

  add_filter "/spec/"

  add_group "DirectiveValue", "lib/directive_value"
  add_group "Source", "lib/directive_value/source"
end

SimpleCov.coverage_dir "coverage"
