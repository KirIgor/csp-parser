# frozen_string_literal: true

require_relative "./directive_value/serialized_source_list"
require_relative "./directive_value/token"
require_relative "./directive_value/sandbox"
require_relative "./directive_value/default"
require_relative "./grammar"

class Directive
  ParseError = Class.new(StandardError)

  DIRECTIVE_VALUES = {
    "child-src" => DirectiveValue::SerializedSourceList,
    "connect-src" => DirectiveValue::SerializedSourceList,
    "default-src" => DirectiveValue::SerializedSourceList,
    "font-src" => DirectiveValue::SerializedSourceList,
    "frame-src" => DirectiveValue::SerializedSourceList,
    "img-src" => DirectiveValue::SerializedSourceList,
    "manifest-src" => DirectiveValue::SerializedSourceList,
    "media-src" => DirectiveValue::SerializedSourceList,
    "object-src" => DirectiveValue::SerializedSourceList,
    "prefetch-src" => DirectiveValue::SerializedSourceList,
    "script-src" => DirectiveValue::SerializedSourceList,
    "script-src-elem" => DirectiveValue::SerializedSourceList,
    "script-src-attrs" => DirectiveValue::SerializedSourceList,
    "style-src" => DirectiveValue::SerializedSourceList,
    "style-src-elem" => DirectiveValue::SerializedSourceList,
    "style-src-attr" => DirectiveValue::SerializedSourceList,
    "worker-src" => DirectiveValue::SerializedSourceList,
    "base-uri" => DirectiveValue::SerializedSourceList,
    "sandbox" => DirectiveValue::Sandbox,
    "form-action" => DirectiveValue::SerializedSourceList,
    "frame-ancestors" => DirectiveValue::SerializedSourceList,
    "navigate-to" => DirectiveValue::SerializedSourceList,
    "report-to" => DirectiveValue::Token,
  }.freeze

  def initialize(value_str)
    @value_str = value_str
    @match = value_str.match(/\A#{Grammar::SERIALIZED_DIRECTIVE}\z/o)

    raise ParseError, @value_str if @match.nil?

    @name = @match["name"]
    value_class = DIRECTIVE_VALUES[@name] || DirectiveValue::Default
    @value = value_class.new(@match["value"])
  end

  attr_reader :name, :value

  def to_s
    @value_str
  end
end
