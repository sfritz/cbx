require 'base64'
require 'openssl'

class CbAuth
  KEY        = 'CB-ACCESS-KEY'.freeze
  SIGN       = 'CB-ACCESS-SIGN'.freeze
  TIMESTAMP  = 'CB-ACCESS-TIMESTAMP'.freeze
  PASSPHRASE = 'CB-ACCESS-PASSPHRASE'.freeze
  HASH       = 'sha256'.freeze

  def initialize(key:, secret:, passphrase:)
    @secret     = Base64.decode64(secret)
    @key        = key
    @passphrase = passphrase
  end

  def name
    :cb_auth
  end

  def call req 
    ts = Time.now.to_i
    req.header[KEY]        = @key
    req.header[SIGN]       = sign_header(req, ts)
    req.header[TIMESTAMP]  = ts
    req.header[PASSPHRASE] = @passphrase
  end

  def sign_header(req, ts)
    method  = req.verb.upcase
    path    = req.url.path
    body    = req.body
    message = "#{ts}#{method}#{path}#{body}"
    hash = OpenSSL::HMAC.digest(HASH, @secret, message)
    Base64.encode64(hash)
  end
end
