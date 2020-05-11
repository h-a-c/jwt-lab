json.extract! user, :id, :name, :email, :secret_fact, :created_at, :updated_at
json.url user_url(user, format: :json)
