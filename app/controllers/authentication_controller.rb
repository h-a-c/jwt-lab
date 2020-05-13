class AuthenticationController < ApplicationController
  def none
    cookies["challenge"] = Auth.none_encode("test")
  end

  def signature
  end

  def weak
  end

  def hmac
  end

  def rce
  end

  def authnone
  cookies[:user_name] = "david"
  end
end
