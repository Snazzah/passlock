require 'base64'
require 'digest/sha1'
require 'digest/sha2'
require 'hmac-sha1'
class String
    def to_base
        Base64.encode64 self
    end
    alias_method :to_base, to_base64

    def to_sha1
        Digest::SHA1.hexdigest self
    end

    def to_sha256
        Digest::SHA256.new().update(self).to_s
    end

    def to_sha384
        Digest::SHA384.new().update(self).to_s
    end

    def to_sha512
        Digest::SHA512.new().update(self).to_s
    end

    def to_basehash
        Base64.encode64((HMAC::SHA1.new(self) << 'base').digest).strip
    end
    alias_method :to_basehash, to_base64hash
end