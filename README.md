[![Gem Version](https://img.shields.io/gem/v/passlock.svg)]() [![Gem Downloads](https://img.shields.io/gem/dt/passlock.svg)]() [![Travis](https://img.shields.io/travis/SnazzyPine25/passlock.svg)]()
# passlock
A gem that makes ideal passwords in various ways.

## Dependencies
* [ruby-hmac](https://github.com/topfunky/ruby-hmac)

## Examples
Installing PassLock is very easy!
```ruby
gem install passlock
```
PassLock provides many encryptions...
```ruby
require 'passlock'
PassLock.base64 'hello'
PassLock.base64hash 'world!'
PassLock.sha1 'how'
PassLock.sha256 'do'
PassLock.sha384 'you'
PassLock.sha512 'do?'
```
You can also encrypt in layers!
```ruby
PassLock.base64('somepass', layers: 20)
```
PassLock also makes modules into String...
```ruby
'liven'.to_sha1
'up'.to_sha256
'some!'.to_basehash
```
