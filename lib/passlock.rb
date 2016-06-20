require 'passlock/class'
require 'passlock/version'
require 'base64'
require 'digest/sha1'
require 'digest/sha2'
require 'hmac-sha1'
require 'securerandom'

# PassLock base module
module PassLock
  @opts = {
    'number' => '1234567890',
    'upletter' => 'qwertyuiopasdfghjklzxcvbnm'.upcase,
    'downletter' => 'qwertyuiopasdfghjklzxcvbnm',
    'symbols' => %q(`~!@#$%^&*()_+-=[]{}\|;':",.<>/?)
  }

  # A randomly generated passord.
  # @param options [Array] Options for the password given in strings. Available strings `number` `upletter` `downletter` `symbol`
  # @param length [Integer] How long the password will be
  # @return [String] Returns the Base64-encoded version of the password.
  def self.cpass(options, length)
    options = options != Array || options.empty? ? options : %w(number upletter downletter symbol)
    length = length.is_a(Integer) && length > 0 ? length : 10
    chars = []
    result = ''
    options.each do |flag|
      chars.concat(@opts[flag].scan(/./)) unless @opts[flag].nil?
    end
    length.to_i.times do
      result += chars.sample
    end
    result
  end

  # Creates a UUID.
  # @return [String] The UUID
  def self.uuid
    SecureRandom.uuid
  end

  # Encodes password in Base64.
  # @param pass [String] The password to be encoded
  # @param layers [Fixnum] The amount of layering
  # @return [String] Returns the Base64-encoded version of the password
  def self.base64(pass, layers: 1)
    layers.times do
      pass = Base64.encode64 pass
    end
    pass
  end

  # Creats a SHA1 hash.
  # @param pass [String] The password to be encoded
  # @param layers [Fixnum] The amount of layering
  # @return [String] The SHA1 hash
  def self.sha1(pass, layers: 1)
    layers.times do
      pass = Digest::SHA1.hexdigest pass
    end
    pass
  end

  # Creats a SHA256 hash.
  # @param pass [String] The password to be encoded
  # @param layers [Fixnum] The amount of layering
  # @return [String] The SHA256 hash
  def self.sha256(pass, layers: 1)
    layers.times do
      pass = Digest::SHA256.new.update(pass).to_s
    end
    pass
  end

  # Creats a SHA384 hash.
  # @param pass [String] The password to be encoded
  # @param layers [Fixnum] The amount of layering
  # @return [String] The SHA384 hash
  def self.sha384(pass, layers: 1)
    layers.times do
      pass = Digest::SHA384.new.update(pass).to_s
    end
    pass
  end

  # Creats a SHA512 hash.
  # @param pass [String] The password to be encoded
  # @param layers [Fixnum] The amount of layering
  # @return [String] The SHA512 hash
  def self.sha512(pass, layers: 1)
    layers.times do
      pass = Digest::SHA512.new.update(pass).to_s
    end
    pass
  end

  # Encodes password in Base64 encoded hash.
  # @param pass [String] The password to be encoded
  # @param layers [Fixnum] The amount of layering
  # @return [String] The Base64-encoded hash
  def self.base64hash(pass, layers: 1)
    layers.times do
      pass = Base64.encode64((HMAC::SHA1.new(pass) << 'base').digest).strip
    end
    pass
  end

  # Decode module
  class Decode
    # Decodes password in Base64.
    # @param base [String] The Base64-encoded of the original password
    # @return [String] Returns the decoded password
    def self.base64(base)
      Base64.decode64 base
    end
  end
end
