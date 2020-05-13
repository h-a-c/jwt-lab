class AuthenticationController < ApplicationController
  require 'json'
  def none
    if cookies["challenge"].length
      logger.debug("we got a cookie!")
    else
      logger.debug("no cookie to eat")
    end
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
    username = params[:session]["name"]
    @user = User.find_by_name(params[:session]["name"])
    
    if @user.authenticate(params[:session]["password"])
      token = Auth.encode(name: @user.name)
      logger.debug("good password")
      logger.debug(token)
      cookies["challenge"] = token
    else
      logger.debug("bad password")
    end
  end
end