require 'base64'
require 'digest/sha1'
require 'digest/sha2'
require 'hmac-sha1'
class String
    # @see PassLock#base64
    def to_base
        Base64.encode64 self
    end
    alias_method :to_base64, to_base

    # @see PassLock#sha1
    def to_sha1
        Digest::SHA1.hexdigest self
    end

    # @see PassLock#sha256
    def to_sha256
        Digest::SHA256.new().update(self).to_s
    end

    # @see PassLock#sha384
    def to_sha384
        Digest::SHA384.new().update(self).to_s
    end

    # @see PassLock#sha512
    def to_sha512
        Digest::SHA512.new().update(self).to_s
    end

    # @see PassLock#base64hash
    def to_basehash
        Base64.encode64((HMAC::SHA1.new(self) << 'base').digest).strip
    end
    alias_method :to_base64hash, to_basehash
end