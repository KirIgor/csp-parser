# CSPParser

CSPParser is a gem for parsing Content Security Policy.

## Installation

Add `gem "csp-parser"` to your Gemfile.

## Usage

To parse Content Security Policy:
```ruby
# Content-Security-Policy: 
policy_str = "default-src 'self';" + 
         "img-src *;" + 
         "media-src https://*.media2.com:*/path ftp://media3.com;" + 
         "script-src 'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=';" +
         "font-src 'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc=';" +
         "frame-src https:;" +
         "object-src 'none'"

policy = CSPParser.parse(policy_str)
# => #<SerializedPolicy:0x00000001231da870 @directives=[
#      #<Directive:0x00000001231da4d8 @value_str="default-src 'self'", 
#        @name="default-src", 
#        @value=#<DirectiveValue::SerializedSourceList:0x00000001231da280 @value_str="'self'", 
#          @sources=[#<DirectiveValue::Source::Keyword:0x00000001231d99c0 @value_str="'self'">]
#        >
#      >, 
#      #<Directive:0x00000001231d9768 @value_str="img-src *", 
#        @name="img-src", 
#        @value=#<DirectiveValue::SerializedSourceList:0x00000001231d9510 @value_str="*", 
#          @sources=[#<DirectiveValue::Source::HttpHost:0x00000001231d8390 @value_str="*">]
#        >
#      >, 
#      #<Directive:0x00000001231d8110 @value_str="media-src *.media2.com:* ftp://media3.com", 
#        @name="media-src", 
#        @value=#<DirectiveValue::SerializedSourceList:0x00000001231e3e70 
#          @value_str="media-src https://*.media2.com:*/path ftp://media3.com", 
#          @sources=[
#            #<DirectiveValue::Source::HttpHost:0x00000001231e1ff8 @value_str="https://*.media2.com:*/path">, 
#            #<DirectiveValue::Source::Host:0x00000001231e0c70 @value_str="ftp://media3.com">
#          ]
#        >
#      >, 
#      #<Directive:0x00000001231e09c8 @value_str="script-src 'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='", 
#        @name="script-src", 
#        @value=#<DirectiveValue::SerializedSourceList:0x00000001231e0798 
#          @value_str="'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='", 
#          @sources=[
#            #<DirectiveValue::Source::Hash:0x00000001231ebc88 
#              @value_str="'sha256-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='"
#            >
#          ]
#        >
#      >, 
#      #<Directive:0x00000001231eba30 @value_str="font-src 'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='", 
#        @name="font-src", 
#        @value=#<DirectiveValue::SerializedSourceList:0x00000001231eb800 
#          @value_str="'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='", 
#          @sources=[
#            #<DirectiveValue::Source::Nonce:0x00000001231eaab8 
#              @value_str="'nonce-RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc='", 
#            >
#          ]
#        >
#      >, 
#      #<Directive:0x00000001231ea888 @value_str="frame-src https:", 
#        @name="frame-src", 
#        @value=#<DirectiveValue::SerializedSourceList:0x00000001231ea630 @value_str="https:", 
#          @sources=[
#            #<DirectiveValue::Source::Scheme:0x00000001231e96e0 @value_str="https:">
#          ]
#        >
#      >, 
#      #<Directive:0x00000001231e9488 @value_str="object-src 'none'", 
#        @name="object-src", 
#        @value=#<DirectiveValue::SerializedSourceList:0x00000001231e9230 @value_str="'none'", 
#          @sources=[#<DirectiveValue::Source::None:0x00000001231e8b78 @value_str="'none'">]
#        >
#      >
#    ]>

policy.directives.map(&:name)
# => ["default-src", "img-src", "media-src", "script-src", "font-src", "frame-src", "object-src"]

default_src = policy.directives.find { |d| d.name == "default-src" } # DirectiveValue::SerializedSourceList
keyword = default_src.value.sources.first # DirectiveValue::Source::Keyword
keyword.to_s # => "'self'"

media_src = policy.directives.find { |d| d.name == "media-src" } # DirectiveValue::SerializedSourceList
http_host = media_src.value.sources.first # DirectiveValue::Source::HttpHost
http_host.scheme_part # => "https"
http_host.host_part # => "*.media2.com"
http_host.port_part # => "*"
http_host.path_part # => "/path"
http_host.to_s # => "https://*.media2.com:*/path"

script_src = policy.directives.find { |d| d.name == "script-src" } # DirectiveValue::SerializedSourceList
hash = script_src.value.sources.first # DirectiveValue::Source::Hash
hash.algorithm # => "sha256"
hash.value # => "RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc="

font_src = policy.directives.find { |d| d.name == "font-src" } # DirectiveValue::SerializedSourceList
nonce = font_src.value.sources.first # DirectiveValue::Source::Nonce
nonce.value # => "RFWPLDbv2BY+rCkDzsE+0fr8ylGr2R2faWMhq4lfEQc="

frame_src = policy.directives.find { |d| d.name == "frame-src" } # DirectiveValue::SerializedSourceList
scheme = frame_src.value.sources.first # DirectiveValue::Source::Scheme
scheme.to_s # => "https:"

object_src = policy.directives.find { |d| d.name == "object-src" } # DirectiveValue::SerializedSourceList
none = object_src.value.sources.first # DirectiveValue::Source::None
none.to_s # => "'none'"
```

You can also parse individual source:
```ruby
http_host = DirectiveValue::Source::HttpHost.new("https://*.example.com:*/path")
http_host.scheme_part # => "https"
http_host.host_part # => "*.example.com"
http_host.port_part # => "*"
http_host.path_part # => "/path"
http_host.to_s # => "https://*.example.com:*/path"
```

Or just check if http host is valid:
```ruby
CSPParser.valid_http_host_source?("https://*.example.com:*/path")
# => true
CSPParser.valid_http_host_source?("custom-scheme://*.example.com:*/path")
# => false
```

## Contributing

Feel free to contribute at https://github.com/KirIgor/csp-parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Author

Created by Igor Kirianov.

## Reference

1. MDN Web Docs: https://developer.mozilla.org/ru/docs/Web/HTTP/CSP
2. Document: https://www.w3.org/TR/CSP3/