class AuthenticationController < ApplicationController
  require 'json'
  def none
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
    if @user.present? && @user.authenticate(params[:session]["password"])
      token = Auth.encode(name: @user.name)
      cookies["challenge"] = token
    else
      cookies["challenge"] = "incorrect"
    end
    redirect_to '/authentication/none'
  end

  def authhmac
    username = params[:session]["name"]
    @user = User.find_by_name(params[:session]["name"])
    if @user.present? && @user.authenticate(params[:session]["password"])
      token = Auth.encode(name: @user.name)
      cookies["challengex"] = token
    else
      cookies["challenge"] = "incorrect"
    end
    redirect_to '/authentication/hmac'
  end
end