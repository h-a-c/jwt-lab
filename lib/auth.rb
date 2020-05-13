require 'jwt'

class Auth

	def self.none_encode(payload)
		token = JWT.encode payload, nil, 'none'
	end

	def self.none_decode(payload)
		decoded_token = JWT.decode token, nil, false
	end

end