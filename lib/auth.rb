require 'jwt'

class Auth

	def self.none_encode(payload)
			token = JWT.encode payload, nil, 'none'
	end

	def self.none_decode(payload)
		if !defined?(payload)
			decoded_token = JWT.decode payload, nil, false
		else
			decoded_token = payload
		end
	end

	def self.encode(payload)
		rsa_private = OpenSSL::PKey::RSA.generate 2048
		rsa_public = rsa_private.public_key
		token = JWT.encode payload, rsa_private, 'RS256'
	end
end