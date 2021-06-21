# frozen_string_literal: true

Gem::Specification.new do |s|
  s.required_ruby_version = ">= 2.5.0"
  s.name        = "csp_parser"
  s.version     = "0.1.0"
  s.summary     = "Content Security Policy Parser"
  s.description = "Gem for parsing Content Security Policy."
  s.authors     = ["Igor Kirianov"]
  s.email       = "ig6966.ivanov@gmail.com"
  s.homepage =
    "https://rubygems.org/gems/csp_parser"
  s.license = "MIT"

  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.require_paths = ["lib"]
end
