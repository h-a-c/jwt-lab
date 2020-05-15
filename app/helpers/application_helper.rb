module ApplicationHelper
	def fullTitle(page_title = '')
		base_title = 'TokenLab : JWTLabs'
		if page_title.empty?
			base_title
		else
			'TokenLab ' + page_title + ' : JWTLabs'
		end
	end

	def current_user(user = '')
		if cookies().key?("challenge")
			if request.original_url.include? "none"
				none()
			elsif request.original_url.include? "hmac"
				hmac()
			elsif request.original_url.include? "signature"
				signature()
			elsif request.original_url.include? "weak"
				weak()
			elsif request.original_url.include? "kid"
				kid()
			end
		else
			'No cookie challenge available'
		end
	end

	def none
		if cookies['challenge'].count('.') != 2
			return 'Invalid Cookie'
		end
		particles = cookies['challenge'].split('.')
		if particles.size > 2
			result = Auth.decode(cookies['challenge'])
			"Current user is: #{Auth.none_decode(cookies['challenge'])[0]['name']}"
		else
			"Current user is: #{Auth.none_decode(cookies['challenge'])}"
		end
	end

	def hmac
		result = Auth.decode(cookies['challenge'])
		if result.include? "Invalid"
			return Auth.hmac_decode(cookies['challenge'])
		end
		"Current user is: #{result[0]['name']}"
	end

	def signature
		"Current user is: #{Auth.none_decode(cookies['challenge'])[0]['name']}"
	end

	def weak
		result = Auth.weak_decode(cookies['challenge'])
		if result.include? "Invalid"
			return 'Invalid Cookie'
		end
		"Current user is #{result[0]['name']}"
	end

	def kid
		result = Auth.kid_decode(cookies['challenge'])
		if result.include? "Invalid"
			return 'Invalid Cookie'
		end
		"Current user is #{result[0]['name']}"
	end
end
