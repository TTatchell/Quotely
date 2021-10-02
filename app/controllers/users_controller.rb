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
    @quotes = @user.likes.collect(&:quote)
  end

  def liked_authors
    @user = User.find(params[:id])
    @authors = @user.likes.collect(&:quote).collect(&:author)
  end
end
