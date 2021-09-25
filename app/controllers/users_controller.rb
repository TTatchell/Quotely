# frozen_string_literal: true

# Actions for the User class
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def user_quotes
    @user = User.find(params[:id])
    @quotes = @user.quotes
  end

  def user_likes
    @user = User.find(params[:id])
    @likes = @user.likes
  end
end
