# frozen_string_literal: true

require_relative "./directive_value"
require_relative "./base"
require_relative "../grammar"
# rubocop:disable Lint/NonDeterministicRequireOrder, Style/StringConcatenation
Dir[File.dirname(__FILE__) + "/source/*.rb"].each { |file| require file }
# rubocop:enable Lint/NonDeterministicRequireOrder, Style/StringConcatenation

class CSP::DirectiveValue::SerializedSourceList < CSP::DirectiveValue::Base
  SOURCE_LIST = [
    CSP::DirectiveValue::Source::None,
    CSP::DirectiveValue::Source::Keyword,
    CSP::DirectiveValue::Source::Hash,
    CSP::DirectiveValue::Source::Nonce,
    CSP::DirectiveValue::Source::Scheme,
    CSP::DirectiveValue::Source::HttpHost,
    CSP::DirectiveValue::Source::Host,
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
    /\A#{CSP::Grammar::SERIALIZED_SOURCE_LIST}\z/o
  end
end
