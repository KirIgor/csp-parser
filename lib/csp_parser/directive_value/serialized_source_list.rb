# frozen_string_literal: true

require_relative "source"

class CSPParser::DirectiveValue::SerializedSourceList < CSPParser::DirectiveValue::Base
  SOURCE_LIST = [
    CSPParser::DirectiveValue::Source::None,
    CSPParser::DirectiveValue::Source::Keyword,
    CSPParser::DirectiveValue::Source::Hash,
    CSPParser::DirectiveValue::Source::Nonce,
    CSPParser::DirectiveValue::Source::Scheme,
    CSPParser::DirectiveValue::Source::HttpHost,
    CSPParser::DirectiveValue::Source::Host,
  ].freeze

  attr_reader :sources

  def initialize(value_str)
    super

    @sources = @value_str.split.map do |source_str|
      source = SOURCE_LIST.lazy.map do |s|
        s.new(source_str)
      rescue
        nil
      end.find(&:itself)

      source
    end
  end

  private

  def regexp
    /\A#{CSPParser::Grammar::SERIALIZED_SOURCE_LIST}\z/o
  end
end
