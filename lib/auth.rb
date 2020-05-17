require 'jwt'

class Auth

	def self.none_encode(payload)
			token = JWT.encode payload, nil, 'none'
	end

	def self.none_decode(payload)
			JWT.decode payload, nil, false
	end

	def self.hmac_decode(payload)
		hmac_secret = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtpE9DLGusn7hb5gvHuP5\nY+3RjxWfsf+H42JuCSyhfzTrZz+DQreBJIFqz0Hhe3d0qmrA+qyrrZCcRubouveE\nYCXthUHlIb/LwZKfeh+fhYLgvFdsR7VkJUhiEjvgpwhwfljHW7LaDfKV1q+nYBcB\nQtME9pnN0jXRzT7/vdubjs49UFz5DFS38DSl5MxnqyFKUR6yCZJRhPsG8fr5A7ad\nfjJGKm4O8g9K5XnxTpgu/PYLRX+UNxhSFVq0lCDBHR9QQudYbiWXvQGnAdbLDsK2\nlEemTk8yNa3rmy1rAxVMZ8GqAd4x2K6juklb6q4YJkNHv9V4HYJXjRXiwHtjr4NW\nEwIDAQAB\n-----END PUBLIC KEY-----\n"
		begin
			JWT.decode payload, hmac_secret, true, { algorithm: 'HS256' }
		rescue
			"Invalid HMAC Token"
		end
	end

	def self.hmac_encode(payload)
		hmac_secret = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtpE9DLGusn7hb5gvHuP5\nY+3RjxWfsf+H42JuCSyhfzTrZz+DQreBJIFqz0Hhe3d0qmrA+qyrrZCcRubouveE\nYCXthUHlIb/LwZKfeh+fhYLgvFdsR7VkJUhiEjvgpwhwfljHW7LaDfKV1q+nYBcB\nQtME9pnN0jXRzT7/vdubjs49UFz5DFS38DSl5MxnqyFKUR6yCZJRhPsG8fr5A7ad\nfjJGKm4O8g9K5XnxTpgu/PYLRX+UNxhSFVq0lCDBHR9QQudYbiWXvQGnAdbLDsK2\nlEemTk8yNa3rmy1rAxVMZ8GqAd4x2K6juklb6q4YJkNHv9V4HYJXjRXiwHtjr4NW\nEwIDAQAB\n-----END PUBLIC KEY-----\n"		
		JWT.encode payload, hmac_secret, 'HS256'
	end

	def self.encode(payload)
		priv = "-----BEGIN RSA PRIVATE KEY-----\nMIIEpgIBAAKCAQEAtpE9DLGusn7hb5gvHuP5Y+3RjxWfsf+H42JuCSyhfzTrZz+D\nQreBJIFqz0Hhe3d0qmrA+qyrrZCcRubouveEYCXthUHlIb/LwZKfeh+fhYLgvFds\nR7VkJUhiEjvgpwhwfljHW7LaDfKV1q+nYBcBQtME9pnN0jXRzT7/vdubjs49UFz5\nDFS38DSl5MxnqyFKUR6yCZJRhPsG8fr5A7adfjJGKm4O8g9K5XnxTpgu/PYLRX+U\nNxhSFVq0lCDBHR9QQudYbiWXvQGnAdbLDsK2lEemTk8yNa3rmy1rAxVMZ8GqAd4x\n2K6juklb6q4YJkNHv9V4HYJXjRXiwHtjr4NWEwIDAQABAoIBAQClxyB+hGGz547h\nfHldPXnaCbt+iA4o3XYRPfHZFtPW5MDVUlDopiT4dyP760DKkmA31xRBC8Ygpu2h\nXE/8ZoGnpQkXNgzQJo7oyTFS/aAm5f8YRvIl80pqqF2VXRXT1s//irIMTE3A2ITD\nG2GK2ZjliyQ4oNTKiuBl1Uz4o4+PjaCZj18mjZXepGorbl3JC8tBm1pMrhuZE9EJ\nRM465zv+V1WRyvGXbfSW+Zn3rYmpCXMskDQ1KMOdSQyl/JPdMp7cukCj11QNS++/\nqHYHAwtd1QMHH3HDCfOoPBVaFc5287vJm3BMrPouMts8FuCt2UMmBnStdRZhd4tH\n7Rx+7DLBAoGBAO5C/zMHykj2ugg1qRFXMEfobxIWveuDLXs2jRaamWfNNSOoHhu5\nradG0mPM+r8j55Q84DiQfq9JPHJePJjMVgxLbI0QeXZuCXKfUKoMYnrYpT4km9Nk\nsbd3fqlCQmeajf6D43zoiYcW7OS0HN27srIEtiWY4rcmVTNPzFIHbqwRAoGBAMQo\nxNU6rhXBFvuaBcLszafrPABgpOwxNhQ7bPUXG1+RH70lLRl8yC09Ji0qlUiWUn4h\nr/xGKIM0aHtttvajrgSEm7bn+a7yYLDYohnAB2qyOqKdeit8NxVsepG39zlww5IJ\ncmrpiCuEbUMoRre94dvYP0pPg7nOL3h5XPrxY5PjAoGBAJXR9xslmOOMkao749YN\nl0SAOeeL+VywndbOlKVUDYaiGPoU6unQNgvrkrxC1qF+eE5UgUHQSnj6elIIQ95p\nDuqoOtfxNg9sXfB/kX98TiilNjL/XiTtOnr9Xt4b1hnDq+oREOkoZ+JUXh3pzAT5\n1AHwyICXxGgaaJTdZsNl/QehAoGBAIpqjkI8bv0QzIvr6mbavF/iQOuvRpEYRKXQ\nLRlhHcK44CGS6xkSERrDDH5QjxiyYjF4yfsE8q9qutNl3vZ5F2E+xbYySOCnTY1c\nwD3VYCZs760x3DR1KVVnv7G1k7Enngkdu2wvsBOtFYCPGh+r0IVWOYrRQw1Irfyf\n/vlgfjirAoGBAMtwD19GXDCD9anQcn9TgeuFZXdffdm+VvSMAB2k9uiJhJCQTxy7\ny/uTnF7RK+pJpsQz1f8WMdpXXSSnmTLeDmChmG9YPllj9FJD8K5PQLjkKhJS1B7t\n6CwQZcjRJ+adZO+mPtYcefWY8qownL8wP4rOnJ9ZT/hNB7Cz8M2zYmoQ\n-----END RSA PRIVATE KEY-----"
		rsa_private = OpenSSL::PKey::RSA.new(priv)
		JWT.encode payload, rsa_private, 'RS256'
	end

	def self.weak_encode(payload)
		key = "iloveyou"
		JWT.encode payload, key, 'HS256'
	end

	def self.kid_encode(payload)
		file = File.open("rsa_private")
		header = {kid: "rsa_private"}
		file_data = file.read
		JWT.encode payload, file_data, 'HS256', header
	end

	def self.weak_decode(payload)
		begin
			key = "iloveyou"
			JWT.decode payload, key, true, { algorithm: 'HS256' }
		rescue
			"Invalid"
		end
	end

	def self.kid_decode(payload)
		begin
			particles = payload.split(".")
			header = JSON.parse(Base64.decode64(particles[0]))
			file = File.open(header['kid'])
			file_data = file.read
			JWT.decode payload, file_data, 'HS256'
		rescue
			"Invalid"
		end
	end

	def self.kid_encode_test(payload)
		file = File.open("app/views/authentication/random.html.erb")
		header = {kid: "app/views/authentication/random.html.erb"}
		file_data = file.read
		JWT.encode payload, file_data, 'HS256', header
	end

	def self.decode(payload)
		pub = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtpE9DLGusn7hb5gvHuP5\nY+3RjxWfsf+H42JuCSyhfzTrZz+DQreBJIFqz0Hhe3d0qmrA+qyrrZCcRubouveE\nYCXthUHlIb/LwZKfeh+fhYLgvFdsR7VkJUhiEjvgpwhwfljHW7LaDfKV1q+nYBcB\nQtME9pnN0jXRzT7/vdubjs49UFz5DFS38DSl5MxnqyFKUR6yCZJRhPsG8fr5A7ad\nfjJGKm4O8g9K5XnxTpgu/PYLRX+UNxhSFVq0lCDBHR9QQudYbiWXvQGnAdbLDsK2\nlEemTk8yNa3rmy1rAxVMZ8GqAd4x2K6juklb6q4YJkNHv9V4HYJXjRXiwHtjr4NW\nEwIDAQAB\n-----END PUBLIC KEY-----\n"
		pubkey = OpenSSL::PKey::RSA.new(pub)
		begin
			JWT.decode(payload, pubkey, true, { algorithm: "RS256"})
		rescue
			"Invalid RSA Token"
		end
	end

end
