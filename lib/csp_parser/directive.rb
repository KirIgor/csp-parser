# frozen_string_literal: true

class CSPParser::Directive
  ParseError = Class.new(StandardError)

  DIRECTIVE_VALUES = {
    "child-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "connect-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "default-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "font-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "frame-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "img-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "manifest-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "media-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "object-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "prefetch-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "script-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "script-src-elem" => CSPParser::DirectiveValue::SerializedSourceList,
    "script-src-attrs" => CSPParser::DirectiveValue::SerializedSourceList,
    "style-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "style-src-elem" => CSPParser::DirectiveValue::SerializedSourceList,
    "style-src-attr" => CSPParser::DirectiveValue::SerializedSourceList,
    "worker-src" => CSPParser::DirectiveValue::SerializedSourceList,
    "base-uri" => CSPParser::DirectiveValue::SerializedSourceList,
    "sandbox" => CSPParser::DirectiveValue::Sandbox,
    "form-action" => CSPParser::DirectiveValue::SerializedSourceList,
    "frame-ancestors" => CSPParser::DirectiveValue::SerializedSourceList,
    "navigate-to" => CSPParser::DirectiveValue::SerializedSourceList,
    "report-to" => CSPParser::DirectiveValue::Token,
  }.freeze

  def initialize(value_str)
    @value_str = value_str
    @match = value_str.match(/\A#{CSPParser::Grammar::SERIALIZED_DIRECTIVE}\z/o)

    raise ParseError, @value_str if @match.nil?

    @name = @match["name"]
    value_class = DIRECTIVE_VALUES[@name] || CSPParser::DirectiveValue::Default
    @value = value_class.new(@match["value"])
  end

  attr_reader :name, :value

  def to_s
    @value_str
  end
end
