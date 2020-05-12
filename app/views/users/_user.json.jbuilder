json.extract! user, :id, :name, :email, :secret_fact, :password, :password_confirmation, :created_at, :updated_at
json.url user_url(user, format: :json)
