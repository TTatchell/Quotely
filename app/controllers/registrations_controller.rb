# frozen_string_literal: true

# Logic behind creating a new user and sending a welcome email
class RegistrationsController < ApplicationController
  def new
    @user = User.new
    render layout: 'logged_out'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # WelcomeMailer.with(user: @user).welcome_email.deliver_now
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
