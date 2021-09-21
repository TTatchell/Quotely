# frozen_string_literal: true

# This sends a welcome email
class WelcomeMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:3000/sign_in'
    mail(to: @user.email, subject: 'Welcome To Quotely')
  end
end
