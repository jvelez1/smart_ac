class TokenGenerator
  class << self
    # This needs to be improved, not secure.
    def encrypt(payload)
      JWT.encode(payload, nil, 'none')
    end

    def decrypt(token)
      decoded_token = JWT.decode(token, nil, false)
      decoded_token.first
    end
  end
end
