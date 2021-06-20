# frozen_string_literal: true

class Grammar
  ASCII_WHITESPACE = "(\x09|\x0a|\x0c|\x0d|\x20)"
  OPTIONAL_ASCII_WHITESPACE = "#{ASCII_WHITESPACE}*"
  REQUIRED_ASCII_WHITESPACE = "#{ASCII_WHITESPACE}+"
  ALPHA = '[a-zA-Z]'
  DIGIT = '[0-9]'
  SCHEME_PART = "#{ALPHA}([a-zA-Z0-9+\\-.])*"
  HTTP_SCHEME_PART = 'https?'
  SCHEME_SOURCE = "#{SCHEME_PART}:"
  HOST_CHAR = '[a-zA-Z0-9\-]'
  HOST_PART = "(\\*|(?:\\*\\.)?#{HOST_CHAR}+(\\.#{HOST_CHAR}+)*)"
  PORT_PART = "(#{DIGIT}+|\\*)"
  PATH_CHAR = '[a-zA-Z0-9\-._!&\'()*+=]'
  PATH_PART = "/(#{PATH_CHAR}+(?:/#{PATH_CHAR}*)*)?"
  HOST_SOURCE = "(?:(?<scheme_part>#{SCHEME_PART})://)?" +
    "(?<host_part>#{HOST_PART})" +
    "(?::(?<port_part>#{PORT_PART}))?" +
    "(?<path_part>#{PATH_PART})?"
  HTTP_HOST_SOURCE = "(?:(?<scheme_part>#{HTTP_SCHEME_PART})://)?" +
    "(?<host_part>#{HOST_PART})" +
    "(?::(?<port_part>#{PORT_PART}))?" +
    "(?<path_part>#{PATH_PART})?"
  KEYWORD_SOURCE = "('self'|'unsafe-inline'|'unsafe-eval'|'strict-dynamic'|" +
    "'unsafe-hashes'|'report-sample'|'unsafe-allow-redirects')"
  BASE64_VALUE = '[a-zA-Z0-9+/\-_]+={0,2}'
  NONCE_SOURCE = "'nonce-(?<value>#{BASE64_VALUE})'"
  HASH_ALGORITHM = '(sha256|sha384|sha512)'
  HASH_SOURCE = "'(?<algorithm>#{HASH_ALGORITHM})-(?<value>#{BASE64_VALUE})'"
  NONE_SOURCE = "'none'"
  SOURCE_EXPRESSION = "(#{SCHEME_SOURCE}|#{HOST_SOURCE}|#{KEYWORD_SOURCE}" +
    "|#{NONCE_SOURCE}|#{HASH_SOURCE}|#{NONE_SOURCE})"
  SERIALIZED_SOURCE_LIST = "(#{SOURCE_EXPRESSION}(?:#{REQUIRED_ASCII_WHITESPACE}#{SOURCE_EXPRESSION})*)"
  TOKEN_CHAR = '[!#$%&\'*+\-.^_`|~0-9a-zA-Z]'
  TOKEN = "#{TOKEN_CHAR}+"
  SANDBOX = "(|#{TOKEN}(?:#{REQUIRED_ASCII_WHITESPACE}#{TOKEN})*)"
  ANCESTOR_SOURCE = "(#{SCHEME_SOURCE}|#{HOST_SOURCE}|'self')"
  ANCESTOR_SOURCE_LIST = "(#{ANCESTOR_SOURCE}(?:#{REQUIRED_ASCII_WHITESPACE}#{ANCESTOR_SOURCE})*|'none')"
  DIRECTIVE_NAME = '[a-zA-Z0-9\-]+'
  DIRECTIVE_VALUE = "[ \x21-\x2B\\\x2D-\x3A\x3C-\x7E]*"
  SERIALIZED_DIRECTIVE = "(?<name>#{DIRECTIVE_NAME})(?:#{REQUIRED_ASCII_WHITESPACE}(?<value>#{DIRECTIVE_VALUE}))?"
  SERIALIZED_POLICY = "#{SERIALIZED_DIRECTIVE}(?:#{OPTIONAL_ASCII_WHITESPACE};" +
    "(?:#{OPTIONAL_ASCII_WHITESPACE}#{SERIALIZED_DIRECTIVE})?)*"
end