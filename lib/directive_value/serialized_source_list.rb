# frozen_string_literal: true

require_relative "./directive_value"
require_relative "./base"
# rubocop:disable Lint/NonDeterministicRequireOrder, Style/StringConcatenation
Dir[File.dirname(__FILE__) + "/source/*.rb"].each { |file| require file }
# rubocop:enable Lint/NonDeterministicRequireOrder, Style/StringConcatenation

class DirectiveValue::SerializedSourceList < DirectiveValue::Base
  SOURCE_LIST = [
    DirectiveValue::Source::None,
    DirectiveValue::Source::Keyword,
    DirectiveValue::Source::Hash,
    DirectiveValue::Source::Nonce,
    DirectiveValue::Source::Scheme,
    DirectiveValue::Source::HttpHost,
    DirectiveValue::Source::Host,
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
    /\A#{Grammar::SERIALIZED_SOURCE_LIST}\z/o
  end
end
