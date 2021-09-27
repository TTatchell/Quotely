# frozen_string_literal: true

# Loads the welcome page
class WelcomeController < ApplicationController
  def index
    render layout: 'logged_out' unless session[:user_id]
  end
end
