# frozen_string_literal: true

class CSP::Directive
  ParseError = Class.new(StandardError)

  DIRECTIVE_VALUES = {
    "child-src" => CSP::DirectiveValue::SerializedSourceList,
    "connect-src" => CSP::DirectiveValue::SerializedSourceList,
    "default-src" => CSP::DirectiveValue::SerializedSourceList,
    "font-src" => CSP::DirectiveValue::SerializedSourceList,
    "frame-src" => CSP::DirectiveValue::SerializedSourceList,
    "img-src" => CSP::DirectiveValue::SerializedSourceList,
    "manifest-src" => CSP::DirectiveValue::SerializedSourceList,
    "media-src" => CSP::DirectiveValue::SerializedSourceList,
    "object-src" => CSP::DirectiveValue::SerializedSourceList,
    "prefetch-src" => CSP::DirectiveValue::SerializedSourceList,
    "script-src" => CSP::DirectiveValue::SerializedSourceList,
    "script-src-elem" => CSP::DirectiveValue::SerializedSourceList,
    "script-src-attrs" => CSP::DirectiveValue::SerializedSourceList,
    "style-src" => CSP::DirectiveValue::SerializedSourceList,
    "style-src-elem" => CSP::DirectiveValue::SerializedSourceList,
    "style-src-attr" => CSP::DirectiveValue::SerializedSourceList,
    "worker-src" => CSP::DirectiveValue::SerializedSourceList,
    "base-uri" => CSP::DirectiveValue::SerializedSourceList,
    "sandbox" => CSP::DirectiveValue::Sandbox,
    "form-action" => CSP::DirectiveValue::SerializedSourceList,
    "frame-ancestors" => CSP::DirectiveValue::SerializedSourceList,
    "navigate-to" => CSP::DirectiveValue::SerializedSourceList,
    "report-to" => CSP::DirectiveValue::Token,
  }.freeze

  def initialize(value_str)
    @value_str = value_str
    @match = value_str.match(/\A#{CSP::Grammar::SERIALIZED_DIRECTIVE}\z/o)

    raise ParseError, @value_str if @match.nil?

    @name = @match["name"]
    value_class = DIRECTIVE_VALUES[@name] || CSP::DirectiveValue::Default
    @value = value_class.new(@match["value"])
  end

  attr_reader :name, :value

  def to_s
    @value_str
  end
end
