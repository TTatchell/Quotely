# frozen_string_literal: true

# Controls the user log in, log out, omniauth process
class SessionsController < ApplicationController
  def new
    render layout: 'logged_out'
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: success
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end

  def omniauth
    user = User.create_from_omniauth(auth, auth_info)
    if user.valid?
      session[:user_id] = user.id
      redirect_to root_path, notice: success
    else
      redirect_to root_path, notice: user.errors.full_messages.join(', ')
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def auth_info
    request.env['omniauth.auth']['info']
  end

  def success
    'Logged In Successfully!'
  end
end
