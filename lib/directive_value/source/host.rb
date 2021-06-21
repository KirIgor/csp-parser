# frozen_string_literal: true

require_relative "./source"
require_relative "./base"
require_relative "../../grammar"

class CSP::DirectiveValue::Source::Host < CSP::DirectiveValue::Source::Base
  def scheme_part
    @match[:scheme_part]
  end

  def host_part
    @match[:host_part]
  end

  def port_part
    @match[:port_part]
  end

  def path_part
    @match[:path_part]
  end

  private

  def regexp
    /\A#{CSP::Grammar::HOST_SOURCE}\z/o
  end
end
