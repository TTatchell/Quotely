# frozen_string_literal: true

# Actions for the User class
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
